# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Tag.create([
  { name: '日本語' },
  { name: '英語' },
  { name: '歌詞なし' },
  { name: '春' },
  { name: '夏' },
  { name: '秋' },
  { name: '冬' },
  { name: '通年' },
  { name: '楽しい' },
  { name: '恋愛' },
  { name: '悲しい' },
  { name: '懐かしい' }
])