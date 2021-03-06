# 市区町村郡
class City < ActiveHash::Base
  include ActiveHash::Associations
  has_many :iryos

  self.data = [
    # 大阪府43個
    { id: 1, name: '大阪市' },
    { id: 2, name: '堺市' },
    { id: 3, name: '池田市' },
    { id: 4, name: '和泉市' },
    { id: 5, name: '泉大津市' },
    { id: 6, name: '泉佐野市' },
    { id: 7, name: '茨木市' },
    { id: 8, name: '大阪挟山市' },
    { id: 9, name: '貝塚市' },
    { id: 10, name: '柏原市' },
    { id: 11, name: '交野市' },
    { id: 12, name: '門真市' },
    { id: 13, name: '河南町' },
    { id: 14, name: '河内長野市' },
    { id: 15, name: '岸和田市' },
    { id: 16, name: '熊取町' },
    { id: 17, name: '四條畷市' },
    { id: 18, name: '島本町' },
    { id: 19, name: '吹田市' },
    { id: 20, name: '摂津市' },
    { id: 21, name: '泉南市' },
    { id: 22, name: '太子町' },
    { id: 23, name: '大東市' },
    { id: 24, name: '高石市' },
    { id: 25, name: '高槻市' },
    { id: 26, name: '田尻町' },
    { id: 27, name: '忠岡町' },
    { id: 28, name: '千早赤阪村' },
    { id: 29, name: '豊中市' },
    { id: 30, name: '豊能町' },
    { id: 31, name: '豊田林市' },
    { id: 32, name: '寝屋川市' },
    { id: 33, name: '能勢町' },
    { id: 34, name: '羽曳野市' },
    { id: 35, name: '阪南市' },
    { id: 36, name: '東大阪市' },
    { id: 37, name: '枚方市' },
    { id: 38, name: '藤井寺市' },
    { id: 39, name: '松原市' },
    { id: 40, name: '岬町' },
    { id: 41, name: '箕面市' },
    { id: 42, name: '守口市' },
    { id: 43, name: '八尾市' },
    # 兵庫県49個
    { id: 44, name: '神戸市' },
    { id: 45, name: '姫路市' },
    { id: 46, name: '尼崎市' },
    { id: 47, name: '明石市' },
    { id: 48, name: '西宮市' },
    { id: 49, name: '洲本市' },
    { id: 50, name: '芦屋市' },
    { id: 51, name: '伊丹市' },
    { id: 52, name: '相生市' },
    { id: 53, name: '豊岡市' },
    { id: 54, name: '加古川市' },
    { id: 55, name: '赤穂市' },
    { id: 56, name: '西脇市' },
    { id: 57, name: '宝塚市' },
    { id: 58, name: '三木市' },
    { id: 59, name: '高砂市' },
    { id: 60, name: '川西市' },
    { id: 61, name: '小野市' },
    { id: 62, name: '三田市' },
    { id: 63, name: '加西市' },
    { id: 64, name: '丹波篠山市' },
    { id: 65, name: '養父市' },
    { id: 66, name: '丹波市' },
    { id: 67, name: '南あわじ市' },
    { id: 68, name: '朝来市' },
    { id: 69, name: '淡路市' },
    { id: 70, name: '宍粟市' },
    { id: 71, name: '加東市' },
    { id: 72, name: 'たつの市' },
    { id: 73, name: '川辺郡' },
    { id: 74, name: '猪名川町' },
    { id: 75, name: '多可郡' },
    { id: 76, name: '多可町' },
    { id: 77, name: '加古郡' },
    { id: 78, name: '稲美町' },
    { id: 79, name: '播磨町' },
    { id: 80, name: '神崎郡' },
    { id: 81, name: '市川町' },
    { id: 82, name: '福崎町' },
    { id: 83, name: '神河町' },
    { id: 84, name: '揖保郡' },
    { id: 85, name: '太子町' },
    { id: 86, name: '赤穂郡' },
    { id: 87, name: '上郡町' },
    { id: 88, name: '佐用郡' },
    { id: 89, name: '佐用町' },
    { id: 90, name: '美方郡' },
    { id: 91, name: '香美町' },
    { id: 92, name: '新温泉町' },
    # 京都府32個
    { id: 93, name: '京都市' },
    { id: 94, name: '福知山市' },
    { id: 95, name: '舞鶴市' },
    { id: 96, name: '綾部市' },
    { id: 97, name: '宇治市' },
    { id: 98, name: '宮津市' },
    { id: 99, name: '亀岡市' },
    { id: 100, name: '城陽市' },
    { id: 101, name: '向日市' },
    { id: 102, name: '長岡京市' },
    { id: 103, name: '八幡市' },
    { id: 104, name: '京田辺市' },
    { id: 105, name: '京丹後市' },
    { id: 106, name: '南丹市' },
    { id: 107, name: '木津川市' },
    { id: 108, name: '乙訓郡' },
    { id: 109, name: '大山崎町' },
    { id: 110, name: '久世郡' },
    { id: 111, name: '久御山町' },
    { id: 112, name: '綴喜郡' },
    { id: 113, name: '井手町' },
    { id: 114, name: '宇治田原町' },
    { id: 115, name: '相楽郡' },
    { id: 116, name: '笠置町' },
    { id: 117, name: '和束町' },
    { id: 118, name: '精華町' },
    { id: 119, name: '南山城村' },
    { id: 120, name: '船井郡' },
    { id: 121, name: '京丹波町' },
    { id: 122, name: '与謝郡' },
    { id: 123, name: '伊根町' },
    { id: 124, name: '与謝野町' },
    # 滋賀県22個
    { id: 125, name: '大津市' },
    { id: 126, name: '彦根市' },
    { id: 127, name: '長浜市' },
    { id: 128, name: '近江八幡市' },
    { id: 129, name: '草津市' },
    { id: 130, name: '守山市' },
    { id: 131, name: '栗東市' },
    { id: 132, name: '甲賀市' },
    { id: 133, name: '野洲市' },
    { id: 134, name: '湖南市' },
    { id: 135, name: '高島市' },
    { id: 136, name: '東近江市' },
    { id: 137, name: '米原市' },
    { id: 138, name: '蒲生郡' },
    { id: 139, name: '日野町' },
    { id: 140, name: '竜王町' },
    { id: 141, name: '愛知郡' },
    { id: 142, name: '愛荘町' },
    { id: 143, name: '犬上郡' },
    { id: 144, name: '豊郷町' },
    { id: 145, name: '甲良町' },
    { id: 146, name: '多賀町' },
    # 奈良県46個
    { id: 147, name: '奈良市' },
    { id: 148, name: '大和高田市' },
    { id: 149, name: '大和郡山市' },
    { id: 150, name: '天理市' },
    { id: 151, name: '橿原市' },
    { id: 152, name: '桜井市' },
    { id: 153, name: '五條市' },
    { id: 154, name: '御所市' },
    { id: 155, name: '生駒市' },
    { id: 156, name: '香芝市' },
    { id: 157, name: '葛城市' },
    { id: 158, name: '宇陀市' },
    { id: 159, name: '山辺郡' },
    { id: 160, name: '山添村' },
    { id: 161, name: '生駒郡' },
    { id: 162, name: '平群町' },
    { id: 163, name: '三郷町' },
    { id: 164, name: '斑鳩町' },
    { id: 165, name: '安堵町' },
    { id: 166, name: '磯城郡' },
    { id: 167, name: '川西町' },
    { id: 168, name: '三宅町' },
    { id: 169, name: '田原本町' },
    { id: 170, name: '宇陀郡' },
    { id: 171, name: '曽爾村' },
    { id: 172, name: '御杖村' },
    { id: 173, name: '高市郡' },
    { id: 174, name: '高取町' },
    { id: 175, name: '明日香村' },
    { id: 176, name: '北葛城郡' },
    { id: 177, name: '上牧町' },
    { id: 178, name: '王寺町' },
    { id: 179, name: '広陵町' },
    { id: 180, name: '河合町' },
    { id: 181, name: '吉野郡' },
    { id: 182, name: '吉野町' },
    { id: 183, name: '大淀町' },
    { id: 184, name: '下市町' },
    { id: 185, name: '黒滝村' },
    { id: 186, name: '天川村' },
    { id: 187, name: '野迫川村' },
    { id: 188, name: '十津川村' },
    { id: 189, name: '下北山村' },
    { id: 190, name: '紙北山村' },
    { id: 191, name: '川上村' },
    { id: 192, name: '東吉野村' },
    # 和歌山県36個
    { id: 193, name: '和歌山市' },
    { id: 194, name: '海南市' },
    { id: 195, name: '橋本市' },
    { id: 196, name: '有田市' },
    { id: 197, name: '御坊市' },
    { id: 198, name: '田辺市' },
    { id: 199, name: '新宮市' },
    { id: 200, name: '紀の川市' },
    { id: 201, name: '岩出市' },
    { id: 202, name: '海草郡' },
    { id: 203, name: '紀美野町' },
    { id: 204, name: '伊都郡' },
    { id: 205, name: 'かつらぎ町' },
    { id: 206, name: '九度山町' },
    { id: 207, name: '高野町' },
    { id: 208, name: '有田郡' },
    { id: 209, name: '湯浅町' },
    { id: 210, name: '広川町' },
    { id: 211, name: '有田川町' },
    { id: 212, name: '日高郡' },
    { id: 213, name: '美浜町' },
    { id: 214, name: '日高町' },
    { id: 215, name: '由良町' },
    { id: 216, name: '印南町' },
    { id: 217, name: 'みなべ町' },
    { id: 218, name: '日高川町' },
    { id: 219, name: '西牟婁郡' },
    { id: 220, name: '白浜町' },
    { id: 221, name: '上富田町' },
    { id: 222, name: 'すさみ町' },
    { id: 223, name: '東牟婁郡' },
    { id: 224, name: '那智勝浦町' },
    { id: 225, name: '太地町' },
    { id: 226, name: '古座川町' },
    { id: 227, name: '北山村' },
    { id: 228, name: '串本町' },
    # 三重県36個
    { id: 229, name: '津市' },
    { id: 230, name: '四日市' },
    { id: 231, name: '伊勢市' },
    { id: 232, name: '松阪市' },
    { id: 233, name: '桑名市' },
    { id: 234, name: '鈴鹿市' },
    { id: 235, name: '名張市' },
    { id: 236, name: '尾鷲市' },
    { id: 237, name: '亀山市' },
    { id: 238, name: '鳥羽市' },
    { id: 239, name: '熊野市' },
    { id: 240, name: 'いなべ市' },
    { id: 241, name: '志摩市' },
    { id: 242, name: '伊賀市' },
    { id: 243, name: '桑名郡' },
    { id: 244, name: '木曽岬町' },
    { id: 245, name: '員弁郡' },
    { id: 246, name: '東員町' },
    { id: 247, name: '三重郡' },
    { id: 248, name: '菰野町' },
    { id: 249, name: '朝日町' },
    { id: 250, name: '川越町' },
    { id: 251, name: '多気郡' },
    { id: 252, name: '多気町' },
    { id: 253, name: '明和町' },
    { id: 254, name: '大台町' },
    { id: 255, name: '度会郡' },
    { id: 256, name: '玉城町' },
    { id: 257, name: '度会町' },
    { id: 258, name: '大紀町' },
    { id: 259, name: '南伊勢町' },
    { id: 260, name: '北牟婁郡' },
    { id: 261, name: '紀北町' },
    { id: 262, name: '南牟婁郡' },
    { id: 263, name: '御浜町' },
    { id: 264, name: '紀宝町' },

  ]
end