require "csv"   # CSVライブラリを読み込み

puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"
memo_type = gets.to_i   # ユーザーの入力値を整数に変換

# ここから先を実装していきましょう
# memo_type が 1 のときは新規作成、2 のときは既存編集、それ以外は再入力
# それぞれの分岐の中で、入力された文字列を CSV ファイルに書き出します

# ループ処理
loop do
    if memo_type == 1
        puts "新規作成します。ファイル名(拡張子を除く)を入力してください。"
        file_name = gets.chomp

        puts "メモ内容を入力してください。"
        puts "入力が終了したら Ctrl+D を押してください。"
        memo_content = $stdin.read

        # CSVに書き出し。
        CSV.open("#{file_name}.CSV", "w") do |csv|
           memo_content.each_line do |line|
            csv << [line.chomp]
           end
        end
        puts "#{file_name}.csv に保存しました。"
        break

    elsif memo_type == 2
        puts "既存のメモを編集します。編集したいファイル名(拡張子を除く)を入力してください。"
        file_name = gets.chomp

        #ファイルの有無
        if File.exist?("#{file_name}.csv")
            puts "追記内容を入力してください。"
            puts "入力を終了するには Ctrl+D を押してください。"
            memo_content = $stdin.read

        # 既存ファイルに追記
           CSV.open("#{file_name}.csv", "a") do |csv|
             memo_content.each_line do |line|
               csv << [line.chomp]
             end
           end
           puts "#{file_name}.csv に追記しました。"
           break
        else
            puts "指定されたファイル(#{file_name}.csv) が見つかりません。最初からやり直してください。"
        end
    # 1,2以外の処理
    else
        puts "1か2で入力してください。"
        puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"
        memo_type = gets.to_i
    end
end