#!/bin/bash

# ./publicディレクトリ内のファイルリストを作成
lsResult=`ls ./public/results/ | grep  ".png"`

# ファイルリストを改行区切りで配列に格納
fileList=`echo $lsResult | tr " " "\n"`

# fileListのループ
for file in $fileList
do
  # ファイル名から拡張子を除いた名前を取得
  uuid=`echo $file | sed -e "s/.png//g"`
  cat ./data/snsCardPageTemplate.html | sed -e "s/__UUID__/$uuid/g" > ./public/results/$uuid.html
done


