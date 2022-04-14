require "csv"
 puts " 1 (新規でメモを作成)  2 (既存のメモ編集する)　※半角英数字入力"
 
 memo_type = gets.chomp.to_s
 
 puts "あなたが入力した文字は「 " + memo_type + " 」です。"
 
 #続きを書いていきましょう！！(ifで条件分岐)
 
 if memo_type.to_i == 1
     
     puts "拡張子を除いたファイル名を入力してください。"
       
     title_name = gets.chomp.to_s
       
     puts "保存するファイル名は「 " + title_name + " .csv 」です。"
     puts "メモしたい内容を記入して下さい"
     puts "完了したら「 Ctrl + D 」を押します"
       
     memo = STDIN.readlines.to_s
       
     CSV.open("#{title_name}.csv","w") do |csv|
         csv << [memo]
     end
    
 elsif memo_type.to_i == 2
     
     puts "拡張子を除いた既存のファイル名を入力してください。"
     
     title_name = gets.chomp.to_s
     
     puts "編集する既存のファイル名は「 " + title_name + ".csv 」です。"
     puts " w (既存ファイルの上書き) a (既存ファイルの追記)　※半角英数字入力"
     
     mode_type = gets.chomp.to_s
     
     
     if mode_type.to_s == "w"
         puts "「 " + title_name + ".csv 」の上書きを実行します。"
         puts "--------現在あるメモを以下に表示します----------"
         deta = CSV.read("#{title_name}.csv",headers: true)
         puts deta
         puts "------------------------------------------------"
         puts "上書きしたい内容を記入して下さい"
         puts "完了したら「 Ctrl + D 」を押します"
         
     elsif mode_type.to_s =="a"
         puts "「 " + title_name + ".csv 」の追記を実行します。"
         puts "--------現在あるメモを以下に表示します----------"
         deta = CSV.read("#{title_name}.csv",headers: true)
         puts deta
         puts "------------------------------------------------"
         puts "追記したい内容を記入して下さい"
         puts "完了したら「 Ctrl + D 」を押します"
         
     else
         puts "あなたが入力した文字は「 " + mode_type + " 」です。"
         puts "入力エラーです。半角英数字「 w 」または、「 a 」を入力して下さい。"
     end
    
     memo = STDIN.readlines.to_s
    
     CSV.open("#{title_name}.csv","#{mode_type}") do |csv|
         csv << [memo]
     end
     
 else
     
     puts "入力エラーです。半角英数字「 1 」または、「 2 」を入力して下さい。"
 end

