class Player
  def hand
    content = true
    while content
      puts "数字を入力してください。"
      puts "0:グー, 1:チョキ, 2:パー"
      input_hand = gets.to_i
      if input_hand == 0 || input_hand == 1 || input_hand == 2
        return  input_hand
      end
    end
  end
end

class Enemy
  def hand
    return rand(0..2)
  end
end

class Janken
  def pon(player_hand, enemy_hand)
    janken = ["グー", "チョキ", "パー"]
    puts "相手の手は#{janken[enemy_hand]}です"
    while true
      dif = (player_hand - enemy_hand).abs
      if (dif + 3) % 3 == 2
        puts "あなたの勝ちです"
        return  false
      elsif (dif + 3) % 3 == 1
        puts "あなたの負けです"
        return  false
      else
        puts "あいこです"
        return  true
      end
    end
  end
end

player = Player.new
enemy = Enemy.new
janken = Janken.new
next_game = true

while next_game
next_game = janken.pon(player.hand, enemy.hand)
end
