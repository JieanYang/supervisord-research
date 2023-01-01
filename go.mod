module github.com/ochinchina/supervisord

go 1.17

require (
	github.com/evanphx/wildcat v0.0.0-20141114174135-e7012f664567
	github.com/gorilla/mux v1.8.0
	github.com/gorilla/rpc v1.2.0
	github.com/jessevdk/go-flags v1.5.0
	github.com/kardianos/service v1.2.1
	github.com/ochinchina/go-daemon v0.1.5
	github.com/ochinchina/go-ini v1.0.1
	github.com/ochinchina/go-reaper v0.0.0-20181016012355-6b11389e79fc
	github.com/ochinchina/gorilla-xmlrpc v0.0.0-20171012055324-ecf2fe693a2c
	github.com/ochinchina/supervisord/config v0.0.0-20220721095143-c2527852d28f
	github.com/ochinchina/supervisord/events v0.0.0-20220721095143-c2527852d28f
	github.com/ochinchina/supervisord/faults v0.0.0-20220721095143-c2527852d28f
	github.com/ochinchina/supervisord/logger v0.0.0-20220721095143-c2527852d28f
	github.com/ochinchina/supervisord/process v0.0.0-20220520055329-8fdf6b62a44f
	github.com/ochinchina/supervisord/signals v0.0.0-20220721095143-c2527852d28f
	github.com/ochinchina/supervisord/types v0.0.0-20220520055329-8fdf6b62a44f
	github.com/ochinchina/supervisord/util v0.0.0-20220721095143-c2527852d28f
	github.com/ochinchina/supervisord/xmlrpcclient v0.0.0-20220520055329-8fdf6b62a44f
	github.com/panjf2000/gnet/v2 v2.2.2
	github.com/prometheus/client_golang v1.12.2
	github.com/sirupsen/logrus v1.9.0
)

require (
	github.com/beorn7/perks v1.0.1 // indirect
	github.com/cespare/xxhash/v2 v2.1.2 // indirect
	github.com/golang/protobuf v1.5.2 // indirect
	github.com/kardianos/osext v0.0.0-20190222173326-2bc1f35cddc0 // indirect
	github.com/matttproud/golang_protobuf_extensions v1.0.1 // indirect
	github.com/ochinchina/filechangemonitor v0.3.1 // indirect
	github.com/prometheus/client_model v0.2.0 // indirect
	github.com/prometheus/common v0.37.0 // indirect
	github.com/prometheus/procfs v0.7.3 // indirect
	github.com/robfig/cron/v3 v3.0.1 // indirect
	github.com/rogpeppe/go-charset v0.0.0-20190617161244-0dc95cdf6f31 // indirect
	github.com/vektra/errors v0.0.0-20140903201135-c64d83aba85a // indirect
	go.uber.org/atomic v1.10.0 // indirect
	go.uber.org/multierr v1.8.0 // indirect
	go.uber.org/zap v1.21.0 // indirect
	golang.org/x/sys v0.3.0 // indirect
	google.golang.org/protobuf v1.28.0 // indirect
	gopkg.in/natefinch/lumberjack.v2 v2.0.0 // indirect
)

replace (
	github.com/ochinchina/supervisord/config => ./config
	github.com/ochinchina/supervisord/events => ./events
	github.com/ochinchina/supervisord/faults => ./faults
	github.com/ochinchina/supervisord/logger => ./logger
	github.com/ochinchina/supervisord/process => ./process
	github.com/ochinchina/supervisord/signals => ./signals
	github.com/ochinchina/supervisord/types => ./types
	github.com/ochinchina/supervisord/util => ./util
	github.com/ochinchina/supervisord/xmlrpcclient => ./xmlrpcclient
)
