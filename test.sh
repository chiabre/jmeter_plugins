docker run --rm --name jmeter -i -v `pwd`/test:/tmp -w /tmp -p 9270:9270 chiabre/jmeter_plugins:5.4.1-test -t kk_ramp.jmx -JHOST=http://webinarlr.lab.akamas.io/
docker run --rm --name jmeter -i -v 'pwd'/test:/tmp -w /tmp -p 9270:9270 chiabre/plugins:5.4-0.1.0 -t kk_ramp.jmx -JHOST=lrwebinar.lab.akamas.io