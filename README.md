goMontioringDdl 是go通过binlog实现对ddl监控发送钉钉消息

## Install

+ Install Go (1.6+) and set your [GOPATH](https://golang.org/doc/code.html#GOPATH)
+ `go get github.com/qieangel2013/goMontioringDdl`, it will print some messages in console, skip it. :-)
+ cd `$GOPATH/src/github.com/qieangel2013/goMontioringDdl`
+ `go build main`
+ `./main`

## How to use?

+ Create table in MySQL.
+ Config base, see the example config [river.toml](./etc/river.toml).
+ Config ding_webhook_url,send dinding message.
+ Set MySQL source in config file, see [Source](#source) below.
+ Customize MySQL and Elasticsearch mapping rule in config file, see [Rule](#rule) below.
+ Start `./main` and enjoy it.

## Notice

+ binlog format must be **row**.
+ binlog row image must be **full** for MySQL, you may lost some field data if you update PK data in MySQL with minimal or noblob binlog row image. MariaDB only supports full row image.
+ Can not alter table format at runtime.
+ MySQL table which will be synced should have a PK(primary key), multi columns PK is allowed now, e,g, if the PKs is (a, b), we will use "a:b" as the key. The PK data will be used as "id" in Elasticsearch. And you can also config the id's constituent part with other column.
+ You should create the associated mappings in Elasticsearch first, I don't think using the default mapping is a wise decision, you must know how to search accurately.
+ `mysqldump` must exist in the same node with go-mysql-elasticsearch, if not, go-mysql-elasticsearch will try to sync binlog only.
+ Don't change too many rows at same time in one SQL.

## Source

source config.

The format in config file is below:

```
# MySQL data source
[[source]]
schema = "test"
tables = ["*"]

# MySQL data source
[[source]]
schema = "test_1"
tables = ["*", t4]
```
