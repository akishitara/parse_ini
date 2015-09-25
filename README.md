parse_ini
====

## Description

ini形式のファイルをtsv csvに変換するシェルスクリプトです

## Demo

Mysqlのmy.cnfをtsvに変換

```bash
$ ./parse_ini.sh exsample/my.cnf 
client	port	3306
client	socket	/var/run/mysqld/mysqld.sock
mysqld_safe	socket	/var/run/mysqld/mysqld.sock
mysqld_safe	nice	0
mysqld	user	mysql
mysqld	pid-file	/var/run/mysqld/mysqld.pid
mysqld	socket	/var/run/mysqld/mysqld.sock
mysqld	port	3306
mysqld	basedir	/usr
mysqld	datadir	/var/lib/mysql
mysqld	tmpdir	/tmp
mysqld	lc-messages-dir	/usr/share/mysql
mysqld	skip-external-locking	
mysqld	bind-address	127.0.0.1
mysqld	key_buffer	16M
mysqld	max_allowed_packet	16M
mysqld	thread_stack	192K
mysqld	thread_cache_size	8
mysqld	myisam-recover	BACKUP
mysqld	query_cache_limit	1M
mysqld	query_cache_size	16M
mysqld	log_error	/var/log/mysql/error.log
mysqld	expire_logs_days	10
mysqld	max_binlog_size	100M
mysqldump	quick	
mysqldump	quote-names	
mysqldump	max_allowed_packet	16M
isamchk	key_buffer	16M
isamchk	!includedir	/etc/mysql/conf.d/
```

## Usage

```
parse_ini.sh filename Options
```
```
Options:
     -c,  --csv           print csv  format
     -t,  --tsv           print tsv  format
     -j,  --json          print json format

     -h,  --help          print this message
     -v,  --version       print this message
```
