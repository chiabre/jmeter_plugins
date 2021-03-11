# Apache JMeter + plugins 
Docker image to run Apache JMeter test plan that:
* provides standard JMeter execution ()
* embeds the top 30ish most used plugins from jmeter-plugins.org
* [if the Prometheus Listener plugin is the test plan] expose the metrics on port 9270

**Apache JMeter**:an application designed to load test functional behavior and measure performance - https://jmeter.apache.org

**jmeter-plugins.org**: a project that collects and provides a set of plugins for Apache JMeter - https://jmeter-plugins.org/

The **version number** of this images is composed of two version numbers
  * the first is the version of the Apache JMeter 
  * the second is for this docker image itself

`chiabre/jmeter_plugins`

Find Images of this repo on [docker hub](https://hub.docker.com/repository/docker/chiabre/jmeter_plugnins)
Find repo of this images on [github](https://github.com/chiabre/jmeter_plugnins)

## Apache JMeter test execution

* The argumets provided to the Docker container are passed to the JMeter process 
* Only JMeter default/embedded arguments are `-n` (non-GUI mode) and `-Dlog_level.jmeter` (log level)
* Default log leve is set to `OFF`, it can be overridden using `JMETER_LOG_LEVEL` as env. variable (available log levels as per JMeter documentation are `DEBUG`, `INFO`, `WARN`, `ERROR` and `OFF`)
* The `-Jprometheus.ip=0.0.0.0` Prometheus Listener plugin argument is embedded in the image
* JMeter jvm args can be set via `JVM_ARGS` env. varibale

## Embedded JMeter plugins

The image embeds the top 30ish most used plugins from jmeter-plugins.org excluded the GUI related one (eg graphs related plugins)

* [Custom Thread Groups](https://jmeter-plugins.org/?search=jpgc-casutg)
* [PerfMon (Servers Performance Monitoring)](https://jmeter-plugins.org/?search=jpgc-perfmon)
* [Dummy Sampler](https://jmeter-plugins.org/?search=jpgc-dummy)
* [Throughput Shaping Timer](https://jmeter-plugins.org/?search=jpgc-tst)
* [Custom JMeter Functions](https://jmeter-plugins.org/?search=jpgc-functions)
* [Flexible File Writer](https://jmeter-plugins.org/?search=jpgc-ffw)
* [Inter-Thread Communication](https://jmeter-plugins.org/?search=jpgc-fifo)
* [Command-Line Graph Plotting Tool](https://jmeter-plugins.org/?search=jpgc-cmd)
* [Parameterized Controller & Set Variables Action](https://jmeter-plugins.org/?search=jpgc-prmctl)
* [Console Status Logger](https://jmeter-plugins.org/?search=jpgc-csl)
* [Variables from CSV File](https://jmeter-plugins.org/?search=jpgc-csvars)
* [BlazeMeter Uploader](https://jmeter-plugins.org/?search=jpgc-sense)
* [XML Plugins](https://jmeter-plugins.org/?search=jpgc-xml)
* [Weighted Switch Controller](https://jmeter-plugins.org/?search=jpgc-wsc)
* [HTTP Raw Request](https://jmeter-plugins.org/?search=jpgc-httpraw)
* [Auto-Stop Listener](https://jmeter-plugins.org/?search=jpgc-autostop)
* [Random CSV Data Set](https://jmeter-plugins.org/?search=bzm-random-csv)
* [Prometheus Listener Plugin](https://jmeter-plugins.org/?search=jmeter-prometheus)

Additional JMeter plugins can added mounting the in the following folder `/opt/apache-jmeter-${JMETER_VERSION}/lib/ext`

### Supported tags

* Apache JMeter 5.4.1 (openjdk 15)
   * `latest`, `5.4.1-0.1.0`

## How to use this image

### Build using

```console
build.sh
```

### Run using

```console
docker run --rm --name jmeter -i -v `pwd`:`\tmp` -w `\tmp` -p 9270:9270 chiabre/jmeter_plugins -t [YOUR_SCRIPT].jmx
```

`[YOUR_SCRIPT].jmx` as to be present in the current path path, Additional JMeter or Promethues listern argument can be appended to the command.

To expose metrics via the Prometheus exporter add `-p 9270:9270`, metrics will be published at:

http://[JMETER_IP]:9270/metrics/

## Credits
Thanks to https://github.com/hauptmedia/docker-jmeter, https://github.com/hhcordero/docker-jmeter-server, https://github.com/justb4/docker-jmeter and https://github.com/egaillardon/jmeter for providing the Dockerfiles that inspired me. 