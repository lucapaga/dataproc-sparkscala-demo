package it.injenia.demo.dataproc.unibo

import util.{CommandLineOptions, FileUtil, TextUtil}

import org.apache.spark.sql.SparkSession
import org.apache.spark.SparkContext

//package it.injenia.demo.dataproc.unibo

object SparkWordCount {
  def main(args: Array[String]) {
    val quiet = false

    val spark = SparkSession
      .builder
      .appName("SparkWordCount")
      .getOrCreate()

    val sc = spark.sparkContext

    val in = args(0)
    val out = args(1)

      val input = sc.textFile(in)
        .map(line => TextUtil.toText(line)) // also converts to lower case

      val wc1 = input
        .flatMap(line => line.split("""[^\p{IsAlphabetic}]+"""))
        .countByValue() // Returns a Map[T, Long] to the driver; no more RDD!

      val wc2 = wc1.map(key_value => s"${key_value._1},${key_value._2}").toSeq
      val wc = sc.makeRDD(wc2, 1)

      if (!quiet) println(s"Writing output to: $out")
      wc.saveAsTextFile(out)

//    val textFile = sc.textFile("hdfs://...")
//    val counts = textFile.flatMap(line => line.split(" "))
//                 .map(word => (word, 1))
//                 .reduceByKey(_ + _)
//    counts.saveAsTextFile("hdfs://...")
  }
}
