class Ward < ActiveHash::Base

  include ActiveHash::Associations
  has_many :iryos

  self.data = [

    # 大阪府大阪市
    { id: 1, name: '旭区' },
    { id: 2, name: '阿倍野区' },
    { id: 3, name: '生野区' },
    { id: 4, name: '北区' },
    { id: 5, name: '此区' },
    { id: 6, name: '城東区' },
    { id: 7, name: '住之江区' },
    { id: 8, name: '住吉区' },
    { id: 9, name: '大正区' },
    { id: 10, name: '中央区' },
    { id: 11, name: '鶴見区' },
    { id: 12, name: '天王寺区' },
    { id: 13, name: '浪速区' },
    { id: 14, name: '西区' },
    { id: 15, name: '西成区' },
    { id: 16, name: '西淀川区' },
    { id: 17, name: '東住吉区' },
    { id: 18, name: '東成区' },
    { id: 19, name: '東淀川区' },
    { id: 20, name: '平野区' },
    { id: 21, name: '福島区' },
    { id: 22, name: '港区' },
    { id: 23, name: '都島区' },
    { id: 24, name: '淀川区' },
    
    # 大阪府堺市
    { id: 25, name: '堺市堺区' },
    { id: 26, name: '堺市中区' },
    { id: 27, name: '堺市東区' },
    { id: 28, name: '堺市西区' },
    { id: 29, name: '堺市南区' },
    { id: 30, name: '堺市北区' },
    { id: 31, name: '堺市美原区' },

    # 兵庫県神戸市
    { id: 32, name: '東灘区' },
    { id: 33, name: '灘区' },
    { id: 34, name: '兵庫区' },
    { id: 35, name: '長田区' },
    { id: 36, name: '須磨区' },
    { id: 37, name: '垂水区' },
    { id: 38, name: '北区' },
    { id: 39, name: '中央区' },
    { id: 40, name: '西区' },

    # 京都府京都市
    { id: 41, name: '北区' },
    { id: 42, name: '上京区' },
    { id: 43, name: '左京区' },
    { id: 44, name: '中京区' },
    { id: 45, name: '東山区' },
    { id: 46, name: '下京区' },
    { id: 47, name: '南区' },
    { id: 48, name: '右京区' },
    { id: 49, name: '伏見区' },
    { id: 50, name: '山科区' },
    { id: 51, name: '西京区' },
    
    # { id: 52, name: '大東市' },
    # { id: 53, name: '高石市' },
    # { id: 54, name: '高槻市' },
    # { id: 55, name: '田尻町' },
    # { id: 56, name: '忠岡町' },
    # { id: 57, name: '千早赤阪村' },
    # { id: 58, name: '豊中市' },
    # { id: 59, name: '豊能町' },
    # { id: 60, name: '豊田林市' },
    # { id: 61, name: '寝屋川市' },
    # { id: 62, name: '能勢町' },
    # { id: 63, name: '羽曳野市' },
    # { id: 64, name: '阪南市' },
    # { id: 65, name: '東大阪市' },
    # { id: 66, name: '枚方市' },
    # { id: 67, name: '藤井寺市' },
    # { id: 68, name: '松原市' },
    # { id: 69, name: '岬町' },
    # { id: 70, name: '箕面市' },
    # { id: 71, name: '守口市' },
    # { id: 72, name: '八尾市' }
  ]
end
