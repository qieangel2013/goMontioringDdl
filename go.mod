module goMontioringDdl

require (
	github.com/juju/errors v0.0.0-20190930114154-d42613fe1ab9 // indirect
	github.com/siddontang/go-log v0.0.0-20190221022429-1e957dd83bed // indirect
	github.com/siddontang/go-mysql v0.0.0-20191019025932-fba9c9655f7c // indirect
	github.com/siddontang/go-mysql-elasticsearch v0.0.0-20190303130753-7b48b8c785d3 // indirect
	julive.com/river v1.2.3
)

replace (
	golang.org/x/sys => github.com/golang/sys v0.0.0-20191028164358-195ce5e7f934
	golang.org/x/text => github.com/golang/text v0.3.0
	julive.com/river => ./river
)

go 1.13
