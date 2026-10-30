# 手と方向
HANDS = { 1 => "グー", 2 => "チョキ", 3 => "パー" }
DIRECTIONS = { 1 => "上", 2 => "下", 3 => "左", 4 => "右" }

def get_valid_input(max_value, type_name)
    loop do
        print "#{type_name}を選んでください (1~#{max_value}): "
        input = gets.chomp

        # 数字のみ
        if input =~ /\A\d\z/ && (1..max_value).include?(input.to_i)
            return input.to_i
        else
            puts "不正な値です。 1~#{max_value}の数字で入力してください。"
            puts "_" * 40
        end
    end
end

# 勝負がつくまでのループ
loop do
    puts "\n--- じゃんけん... ---"
    HANDS.each { |k, v| print "#{k}: #{v} "}
    puts ""

    # 自分の手
    player_hand = get_valid_input(3, "じゃんけんの手")

    # 相手の手
    enemy_hand = rand(1..3)

    puts "ポン!"
    puts "あなた : #{HANDS[player_hand]}"
    puts "相手 : #{HANDS[enemy_hand]}"
    puts "_" * 20

    # 勝敗判定
    if player_hand == enemy_hand
        puts "あいこです!もう一度!"
        next
    end

    case [player_hand, enemy_hand]
    when [1, 2], [2, 3], [3, 1]
        janken_winner = "player"
        puts "あなたの勝ち!"
    else
        janken_winner = "enemy"
        puts "あなたの負け"
    end

    # あっち向いてホイ
    puts "\n--- あっち向いて... ---"
    DIRECTIONS.each {|k, v| print "#{k}: #{v}" }
    puts ""

    #自分の方向
    player_directions = get_valid_input(4, "方向")
    #相手の方向(ランダム)
    enemy_directions = rand(1..4)

    puts "ホイ!"
    puts "あなた: #{DIRECTIONS[player_directions]}"
    puts "相手: #{DIRECTIONS[enemy_directions]}"
    puts "_" * 20

    # 勝敗判定
    case player_directions
    when enemy_directions
        if janken_winner == "player"
            puts "完全勝利!!!"
        else
            puts "GAME OVER..."
        end
        break
    else
        puts "じゃんけんに戻ります。"
    end
end