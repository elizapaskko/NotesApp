class Note
  attr_accessor :title, :text

  def initialize(title, text)
    @title = title
    @text = text
  end
end

class NoteApp
  def initialize
    @notes = []
  end

  def create_note
    print "Title: "
    title = gets.chomp
    print "Text: "
    text = gets.chomp
    note = Note.new(title, text)
    @notes << note
    puts "Note created."
  end

  def view_notes
    if @notes.empty?
      puts "No notes to display."
    else
      @notes.each do |note|
        puts "#{note.title}: #{note.text}"
      end
    end
  end

  def edit_note
    if @notes.empty?
      puts "No notes to edit."
    else
      print "Enter note title to edit: "
      title = gets.chomp
      note = @notes.find { |note| note.title == title }
      if note.nil?
        puts "Note not found."
      else
        print "New title (#{note.title}): "
        new_title = gets.chomp
        print "New text (#{note.text}): "
        new_text = gets.chomp
        note.title = new_title unless new_title.empty?
        note.text = new_text unless new_text.empty?
        puts "Note updated."
      end
    end
  end

  def delete_note
    if @notes.empty?
      puts "No notes to delete."
    else
      print "Enter note title to delete: "
      title = gets.chomp
      note = @notes.find { |note| note.title == title }
      if note.nil?
        puts "Note not found."
      else
        @notes.delete(note)
        puts "Note deleted."
      end
    end
  end
end

app = NoteApp.new

loop do
  puts "What would you like to do?"
  puts "1. Create a new note"
  puts "2. View all notes"
  puts "3. Edit a note"
  puts "4. Delete a note"
  puts "5. Exit"

  choice = gets.chomp.to_i

  case choice
  when 1
    app.create_note
  when 2
    app.view_notes
  when 3
    app.edit_note
  when 4
    app.delete_note
  when 5
    puts "Goodbye!"
    break
  else
    puts "Invalid choice."
  end

  puts
end

