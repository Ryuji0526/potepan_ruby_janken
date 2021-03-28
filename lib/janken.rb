class Janken
  COMMANDS = {0 => "グー", 1 => "チョキ", 2 => "パー"}
  DIRECTION = ["上", "右", "下", "左"]
  
  def initialize
    @voice = "じゃんけん..."
  end
  
  #じゃんけん
  def start_janken
    puts "#{@voice}\n0(グー)1(チョキ)2(パー)3(戦わない)"
    @selected_command = gets.chomp
    # じゃんけんのコマンドが入力されたら
    if @selected_command == '0' || @selected_command == '1' || @selected_command == '2'
      puts '-----------------------------------'
      puts "ホイ！"
      @user_command = @selected_command.to_i
      @pc_command = rand(3)
      puts "あなた: #{COMMANDS[@user_command]}"
      puts "相手: #{COMMANDS[@pc_command]}"
      judge_janken
    #戦わないを選択したら 
    elsif @selected_command == '3'
      puts "Bye Bye..."
      return
    # 入力された値が期待している値ではなかったら
    else
      print "\e[31m"
      puts "0~3のいずれかの数字を入力してください"
      print "\e[0m"
      start_janken  
    end
  end

  # じゃんけんの勝敗を判定
  def judge_janken
    case @user_command - @pc_command
    # あいこだったら
    when 0
      @voice = "あいこで..."
      start_janken
    #Userが勝利したら 
    when -1,2
      @user_win_janken = true
      start_attimuitehoi
    #PCが勝利したら 
    else 
      @user_win_janken = false
      start_attimuitehoi
    end
  end

  # あっちむいてほい
  def start_attimuitehoi
    puts "-----------------------------------"
    puts "あっちむいて...\n0(上)1(右)2(下)3(左)"
    @selected_direction = gets.chomp
    case @selected_direction
      # 入力された値が期待している値だったら
    when '0', '1', '2', '3'
      @user_direction = @selected_direction.to_i
      @pc_direction = rand(4)
      puts "-----------------------------------"
      puts "ホイ!"
      puts "あなた: #{DIRECTION[@user_direction]}"
      puts "相手: #{DIRECTION[@pc_direction]}"
      judge_attimuitehoi
     # 入力された値が期待している値ではなかったら
    else
      print "\e[31m"
      puts "0~3のいずれかの数字を入力してください"
      print "\e[0m"
      start_attimuitehoi
    end
  end

  # あっち向いてホイの勝敗判定
  def judge_attimuitehoi
    #勝敗が決まったら
    if @user_direction == @pc_direction
      # Userが買ったら
      if @user_win_janken
        print "\e[34m"
        puts "User Win!"
        print "\e[0m"
      else
        #PCが勝ったら
        print "\e[31m"
        puts "PC Win"
        print "\e[0m"
      end
    # 勝敗がきまらなかったら
    else
      @voice = "じゃんけん..."
      puts "-----------------------------------"
      start_janken
    end
  end
end

janken = Janken.new
janken.start_janken
