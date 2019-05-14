---

- Zookeeper list timezones: https://docs.oracle.com/middleware/1221/wcs/tag-ref/MISC/TimeZones.html

- Change zookeeper timezone:

```sh
cd /opt/bitnami/zookeeper/conf
cat log4j.properties
...
log4j.appender.CONSOLE.layout=org.apache.log4j.EnhancedPatternLayout
log4j.appender.ROLLINGFILE.layout=org.apache.log4j.EnhancedPatternLayout
log4j.appender.TRACEFILE.layout=org.apache.log4j.EnhancedPatternLayout
...
```
