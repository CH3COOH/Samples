# 画像の圧縮テスト結果

## ソース

<img src="./source.png" width=320 />

## Android Studio の WebP 変換

Android Studio の WebP 変換機能を使ってまとめた。

| source | encoded | サイズ |
|:----|:----|:----|
| <img src="./source.png" width="320px" /> | <img src="./output.webp" width="320px" /> | 104 KB |

## pngquant（非可逆圧縮）

| source | encoded | サイズ |
|:----|:----|:----|
| <img src="./source.png" width="320px" /> | <img src="./output_pngquant_60.png" width="320px" /> | 454 KB |

## oxipng（ロスレス圧縮）

| source | encoded | サイズ |
|:----|:----|:----|
| <img src="./source.png" width="320px" /> | <img src="./output_oxipng.png" width="320px" /> | 1.3 MB |

## pngquant → oxipng の組み合わせ

| source | encoded | サイズ |
|:----|:----|:----|
| <img src="./source.png" width="320px" /> | <img src="./output_combined.png" width="320px" /> | 413 KB |

## pngquant → oxipng の組み合わせ

| source | encoded | サイズ |
|:----|:----|:----|
| <img src="./source.png" width="320px" /> | <img src="./output_combined.png" width="320px" /> | 413 KB |

## Guetzli

| source | encoded | サイズ |
|:----|:----|:----|
| <img src="./source.png" width="320px" /> | <img src="./output_guetzli.jpg" width="320px" /> | 413 KB |

## mozjpeg

| source | encoded | サイズ |
|:----|:----|:----|
| <img src="./source.png" width="320px" /> | <img src="./output_mozjpeg_80.jpg" width="320px" /> | 177 KB |
|:----|:----|:----|
| <img src="./source.png" width="320px" /> | <img src="./output_mozjpeg_60.jpg" width="320px" /> | 108 KB |


