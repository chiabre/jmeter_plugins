# Apache JMeter + plugins 
Docker image to run Apache JMeter test plan that:
* provides standard JMeter execution
* embeds the top 30ish most used plugins from jmeter-plugins.org 
* [if the Prometheus Listener Plugin is the test plan] expose the metrics on port 9270

**Apache JMeter**: an application designed to load test functional behavior and measure performance - https://jmeter.apache.org

**jmeter-plugins.org**: a project that collects and provides a set of plugins for Apache JMeter - https://jmeter-plugins.org/

The **version number** of this images is composed of two version numbers
  * the first is the version of the Apache JMeter 
  * the second is for this docker image itself

`chiabre/jmeter_plugins`

* Images of this repo on [docker hub](https://hub.docker.com/repository/docker/chiabre/jmeter_plugins)
* Repo of this images on [github](https://github.com/chiabre/jmeter_plugins)

## Apache JMeter test execution

* The argumets provided to the Docker container are passed to the JMeter process 
* Only JMeter default/embedded arguments are `-n` (non-GUI mode) and `-Dlog_level.jmeter` (log level)
* Default log leve is set to `INFO`, it can be overridden using `JMETER_LOG_LEVEL` as env. variable (available log levels as per JMeter documentation are `DEBUG`, `INFO`, `WARN`, `ERROR` and `OFF`)
* The `-Jprometheus.ip=0.0.0.0` Prometheus Listener plugin argument is embedded in the image
* JMeter jvm args can be set via `JVM_ARGS` env. varibale

## Embedded JMeter plugins

The image embeds the top 30ish most used plugins from [jmeter-plugins.org](https://jmeter-plugins.org/stats/) excluded the GUI ones (eg graphs related plugins)

* [Custom Thread Groups](https://jmeter-plugins.org/?search=jpgc-casutg)
* [PerfMon (Servers Performance Monitoring)](https://jmeter-plugins.org/?search=jpgc-perfmon)
* [Dummy Sampler](https://jmeter-plugins.org/?search=jpgc-dummy)
* [Throughput Shaping Timer](https://jmeter-plugins.org/?search=jpgc-tst)
* [Custom JMeter Functions](https://jmeter-plugins.org/?search=jpgc-functions)
* [Flexible File Writer](https://jmeter-plugins.org/?search=jpgc-ffw)
* [Inter-Thread Communication](https://jmeter-plugins.org/?search=jpgc-fifo)
* [Random CSV Data Set](https://jmeter-plugins.org/?search=bzm-random-csv)
* [Weighted Switch Controller](https://jmeter-plugins.org/?search=jpgc-wsc)
* [Console Status Logger](https://jmeter-plugins.org/?search=jpgc-csl)
* [Parameterized Controller & Set Variables Action](https://jmeter-plugins.org/?search=jpgc-prmctl)
* [Parallel Controller & Sampler](https://jmeter-plugins.org/?search=bzm-parallel)
* [BlazeMeter Uploader](https://jmeter-plugins.org/?search=jpgc-sense)
* [Variables from CSV File](https://jmeter-plugins.org/?search=jpgc-csvars)
* [XML Plugins](https://jmeter-plugins.org/?search=jpgc-xml)
* [Weighted Switch Controller](https://jmeter-plugins.org/?search=jpgc-wsc)
* [HTTP Raw Request](https://jmeter-plugins.org/?search=jpgc-httpraw)
* [Auto-Stop Listener](https://jmeter-plugins.org/?search=jpgc-autostop)
* [Prometheus Listener Plugin](https://jmeter-plugins.org/?search=jmeter-prometheus)
* [Parameterized Controller](https://jmeter-plugins.org/?search=jpgc-prmctl)

Image tag `5.6.3-0.1.x` includes the following plugin versions:

```console
PluginsManagerCMD.sh status
INFO o.j.r.PluginManagerCMD: Command is: status
INFO o.j.r.JARSourceHTTP: Found cached repo
INFO o.j.r.PluginManager: Plugins Status: [jpgc-autostop=0.2, jpgc-sense=3.5, jpgc-csl=0.1, jpgc-functions=2.2, jpgc-casutg=2.10, jpgc-dummy=0.4, jpgc-ffw=2.0, jpgc-httpraw=0.1, jpgc-fifo=0.2, bzm-parallel=0.12, jpgc-prmctl=0.4, jpgc-perfmon=2.1, jpgc-plugins-manager=1.10, jmeter-prometheus=0.6.0, bzm-random-csv=0.8, jpgc-tst=2.6, jpgc-csvars=0.1, jpgc-wsc=0.7, jpgc-xml=0.1, jmeter-core=5.6.3, jmeter-ftp=5.6.3, jmeter-http=5.6.3, jmeter-jdbc=5.6.3, jmeter-jms=5.6.3, jmeter-junit=5.6.3, jmeter-java=5.6.3, jmeter-ldap=5.6.3, jmeter-mail=5.6.3, jmeter-mongodb=5.6.3, jmeter-native=5.6.3, jmeter-tcp=5.6.3, jmeter-components=5.6.3]
```

Image tag `5.6-0.1.x` includes the following plugin versions:

```console
PluginsManagerCMD.sh status
INFO o.j.r.PluginManagerCMD: Command is: status
INFO o.j.r.JARSourceHTTP: Found cached repo
INFO o.j.r.PluginManager: Plugins Status: [jpgc-autostop=0.2, jpgc-sense=3.5, jpgc-csl=0.1, jpgc-functions=2.2, jpgc-casutg=2.10, jpgc-dummy=0.4, jpgc-ffw=2.0, jpgc-httpraw=0.1, jpgc-fifo=0.2, bzm-parallel=0.11, jpgc-prmctl=0.4, jpgc-perfmon=2.1, jpgc-plugins-manager=1.8, jmeter-prometheus=0.6.0, bzm-random-csv=0.8, jpgc-tst=2.5, jpgc-csvars=0.1, jpgc-wsc=0.7, jpgc-xml=0.1, jmeter-core=5.6, jmeter-ftp=5.6, jmeter-http=5.6, jmeter-jdbc=5.6, jmeter-jms=5.6, jmeter-junit=5.6, jmeter-java=5.6, jmeter-ldap=5.6, jmeter-mail=5.6, jmeter-mongodb=5.6, jmeter-native=5.6, jmeter-tcp=5.6, jmeter-components=5.6]
```

Image tag `5.5-0.1.2` includes the following plugin versions:

```console
PluginsManagerCMD.sh status
INFO o.j.r.PluginManagerCMD: Command is: status
INFO o.j.r.JARSourceHTTP: Found cached repo
INFO o.j.r.PluginManager: Plugins Status: [jpgc-autostop=0.1, jpgc-sense=3.5, jpgc-csl=0.1, jpgc-functions=2.2, jpgc-casutg=2.10, jpgc-dummy=0.4, jpgc-ffw=2.0, jpgc-httpraw=0.1, jpgc-fifo=0.2, bzm-parallel=0.11, jpgc-prmctl=0.4, jpgc-perfmon=2.1, jpgc-plugins-manager=1.8, jmeter-prometheus=0.6.0, bzm-random-csv=0.8, jpgc-tst=2.5, jpgc-csvars=0.1, jpgc-wsc=0.7, jpgc-xml=0.1, jmeter-core=5.5, jmeter-ftp=5.5, jmeter-http=5.5, jmeter-jdbc=5.5, jmeter-jms=5.5, jmeter-junit=5.5, jmeter-java=5.5, jmeter-ldap=5.5, jmeter-mail=5.5, jmeter-mongodb=5.5, jmeter-native=5.5, jmeter-tcp=5.5, jmeter-components=5.5]
```

Additional JMeter plugins can added mounting them in the following folder `/opt/apache-jmeter-${JMETER_VERSION}/lib/ext`

## Supported tags

* Apache JMeter 5.6.3 (jdk17)
   * `latest`, `5.6.3-0.1.4`
* Apache JMeter 5.6.2 (jdk17)
   * `5.6.2-0.1.3`
* Apache JMeter 5.6 (jdk17)
   * `5.6-0.1.3`, 
   * `5.6-0.1.2`
* Apache JMeter 5.5
   * `5.5-0.1.2`
   * `5.5-0.1.1`
* Apache JMeter 5.4
   * `5.4.1-0.1.0`

## How to use this image

### Build using

```console
build.sh
```

### Run using

```console
docker run --rm --name jmeter -i -v "$(pwd)":/tmp -p 9270:9270 chiabre/jmeter_plugins:5.5-0.1.1 -t [YOUR_SCRIPT].jmx
```

[YOUR_SCRIPT].jmx as to be present in the current path , Additional JMeter or Promethues listern argument can be appended to the command.

To expose metrics via the Prometheus exporter add `-p 9270:9270`, metrics will be published at:

http://[JMETER_IP]:9270/metrics/

## Credits
Thanks to https://github.com/hauptmedia/docker-jmeter, https://github.com/hhcordero/docker-jmeter-server, https://github.com/justb4/docker-jmeter and https://github.com/egaillardon/jmeter for providing the Dockerfiles that inspired me. 
