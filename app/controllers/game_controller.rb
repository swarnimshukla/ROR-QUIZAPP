class GameController < ApplicationController
$i=0
  def index
    @button_id=request[:button_id]
    puts @button_id
    @questions=Question.where subgenre_id:@button_id
    @subgenres=Subgenre.find_by id:@button_id
    puts @subgenres.name
    $i+=1
    puts $i
    if ($i==3)
      $i=0
      a= current_user.score
      current_user.score=0
      current_user.save 
      redirect_to dashboard_index_path, notice: "You scored " + a.to_s

    end  
  end 
 
  def first
    @button_id=params[:index]
    @questions=Question.where subgenre_id:@button_id
    @subgenres=Subgenre.find_by id:@button_id
  end  
 
  def submit  
  	val=[params[:choice1], params[:choice2], params[:choice3], params[:choice4]].join(";")
    val_index=params[:index]
    id=params[:sub]
    @questions=Question.where subgenre_id:id
    puts @questions[val_index.to_i].answer
    puts val
  	if (val==@questions[val_index.to_i].answer)
      puts "kdkjnknksk"
       redirect_to :action =>'index', :button_id => id
       current_user.score+=1  
       current_user.save
       puts current_user.score
    else 
      b=current_user.score
      current_user.score=0
      current_user.save
      redirect_to game_wrong_path, notice: "You scored " + b.to_s
      $i=0

      

     end
   end	


end
