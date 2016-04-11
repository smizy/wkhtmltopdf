# docker-wkhtmltopdf

## html -> image (capture browser screenshot)

```
$ docker run -it --rm -v $(pwd):/code  smizy/wkhtmltopdf:0.12.3 \
wkhtmltoimage \
--width 414 \
--height 736 \
--quality 50  \
--disable-smart-width \
--custom-header-propagation \
--custom-header User-Agent "Mozilla/5.0 (iPhone; CPU iPhone OS 9_0_2 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13A452 Safari/601.1" \
http://www.yahoo.co.jp yahoo.png
```