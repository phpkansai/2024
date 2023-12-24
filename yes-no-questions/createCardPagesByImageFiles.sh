#!/bin/bash

# ./publicディレクトリ内のファイルリストを作成
lsResult=`ls ./public/results/ | grep  ".png"`

# ファイルリストを改行区切りで配列に格納
fileList=`echo $lsResult | tr " " "\n"`

# fileListのループ
for file in $fileList
do
  # なぜかGoogleドライブからpngファイルをまとめでダウンロードするとファイル拡張子前に"_"がついたので削除
  fileName=`echo $file | sed -e "s/_//g"`
  mv ./public/results/$file ./public/results/$fileName
  # ファイル名から拡張子を除いた名前を取得
  uuid=`echo $fileName | sed -e "s/.png//g"`
  cat ./data/snsCardPageTemplate.html | sed -e "s/__UUID__/$uuid/g" > ./public/results/$uuid.html
done


