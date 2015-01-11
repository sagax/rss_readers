#!/bin/bash
function redisplay() (
$(awk --re-interval -f read_rss_russian_rt_com.awk rss > rss_out)
)

function check_news() (
curl -s http://russian.rt.com/rss > rss && md5sum rss | awk '{print $1}' > rss_summ
old=$(cat rss_summ_old)
new=$(cat rss_summ)
if [[ "$old" != "$new" ]]
then
  mv rss_summ rss_summ_old
  echo "обновление получено $(date +%X)"
  redisplay
else
  mv rss_summ rss_summ_old
fi
)

function daemon_() (
n=0
while true
do
  check_news
  ((n=n+1))
  echo $n
  sleep 100
done
)

redisplay
daemon_
