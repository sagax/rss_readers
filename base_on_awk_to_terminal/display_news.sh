#!/bin/bash
printf "$$" > display_news.pid
awk --re-interval -f read_rss_russian_rt_com.awk rss > rss_out
