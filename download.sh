#!/bin/bash

import requests

url = '''https://r1---sn-xgmnpoxuopp-puhe.googlevideo.com/videoplayback?expire=1593000512&ei=4O3yXrzrB4bo8wT6hq2ABw&ip=219.100.37.240&id=o-ANqJ_kvjD5zHcFgSOX5mNA7vMAQq5wgKAd00Sx-ybRHq&itag=22&source=youtube&requiressl=yes&mh=7o&mm=31%2C29&mn=sn-xgmnpoxuopp-puhe%2Csn-oguelnlz&ms=au%2Crdu&mv=m&mvi=0&pl=24&initcwndbps=101250&vprv=1&mime=video%2Fmp4&ratebypass=yes&dur=42900.236&lmt=1512430426203083&mt=1592978797&fvip=1&c=WEB&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cvprv%2Cmime%2Cratebypass%2Cdur%2Clmt&sig=AOq0QJ8wRQIhALnI0hJLaz8jqs5m2aA5Dlf6j9G6U1-HH0yJcSLiuvSrAiArw3IjEmspRJP46ZWkYMYeacAKbucMifVho_-JqLsnVA%3D%3D&lsparams=mh%2Cmm%2Cmn%2Cms%2Cmv%2Cmvi%2Cpl%2Cinitcwndbps&lsig=AG3C_xAwRAIgbQP0yMa505-LKQiWvJFFjq_IgYcuIpaFCkBKL19uIi8CIFpDPhRq4chXRTmZJyKdX9-q0RAiFNjoyTRjDNv9mlnO&contentlength=4751138141&video_id=CyExswc5j7U&title=Video+Replay-+The+Moon+-+Incredible+Lunar+Views+From+The+Japanese+SELENE+Orbiter+-+Earthrise'''


def download_file(url, file_pname, chunk_size=1024*4):
    """
    url: file url
    file_pname: file save path
    chunk_size: chunk size
    """
    # 第一种
    response_data_file = requests.get(url, stream=True)
    with open(file_pname, 'wb') as f:
        for chunk in response_data_file.iter_content(chunk_size=chunk_size):
            print('downloading')
            if chunk:
                f.write(chunk)


    # 第二种
    with requests.get(url, stream=True) as req:
        with open(file_pname, 'wb') as f:
            for chunk in req.iter_content(chunk_size=chunk_size):
                if chunk:
                    f.write(chunk)


download_file(url, 'a.mp4')


