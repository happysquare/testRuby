class CommentObserver < ActiveRecord::Observer
  def after_create(comment)
    
     
      Notifier.comment_update(comment).deliver
     
   end
end
