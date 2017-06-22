class AddPaperclipToCat < ActiveRecord::Migration[5.1]
  def change
    add_attachment :cats, :image
  end
end
