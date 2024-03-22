require_relative 'course'
require_relative 'subject'
require_relative 'room'
require_relative 'student'
require_relative 'teacher'
require_relative 'subject_students'
require 'date'
Course.generate_samples
Subject.generate_samples
Student.generate_samples
Teacher.generate_samples

module MainMenu
  def self.run
    run = true
    while run
      puts 'MAIN MENU'
      puts '-------------------'
      puts '(1) Courses Tab'
      puts '(2) Subjects Tab' # View subjects list , Add subject , Go back
      puts '(3) Students Tab' # View students list , Add student , Go back
      puts '(4) Teachers Tab' # View teachers list , Add teacher , Go back
      puts '(5) Rooms Tab' # View rooms list , Add room , Go back
      puts '(6) Enrollment Tab' # Enroll , Go back
      puts '(7) Exit'
      puts '-------------------'

      puts 'Select one:'
      option = gets.to_i

      case option
      when 1
        fetch_course_tab
      when 2
        fetch_subject_tab
      when 3
        fetch_student_tab
      when 4
        fetch_teacher_tab
      when 5
        fetch_room_tab
      when 6
        fetch_enroll_tab
      when 7
        run = false
      else
        puts 'Invalid input'
      end
    end
  end

  def self.fetch_course_tab
    run = true
    while run
      puts '-------------------'
      puts 'COURSES TAB'
      puts '(1) View courses list'
      puts '(2) Add course'
      puts '(3) Go back'
      puts '-------------------'

      puts 'Select one: '
      option = gets.to_i

      case option
      when 1
        puts 'LISTS OF COURSES'
        puts '-------------------'
        Course.list.each do |course|
          puts "#{course.id} - #{course.name}"
        end
        puts '-------------------'
        puts "Press any key to go back."
        gets.chomp

      when 2
        puts 'ADD A NEW COURSE'
        puts '-------------------'
        print 'Course ID: '
        new_course_id = gets.chomp

        Course.list.each do |course|
          if new_course_id == course.id
            puts 'Error: Course ID already taken.'
            exit
          end
        end

        print 'Course Name: '
        new_course_name = gets.chomp

        Course.list.each do |course|
          if new_course_name == course.name
            puts 'Error: Course Name already taken.'
            exit
          end
        end

        puts 'Would you like to save changes? (y/n)'
        save_input = gets.chomp
        if save_input == 'y' || save_input == 'yes'
          new_course = Course.new(new_course_id, new_course_name)
          new_course.save
          puts "Course has been added successfully. Press any key to go back."
          p Course.list
        else
          puts "Changes not saved. Press any key to go back."
          gets.chomp
        end

      when 3
        run = false
      else
        puts 'Invalid input'
      end
    end
  end

  def self.fetch_subject_tab
    run = true
    while run
      puts '-------------------'
      puts 'SUBJECTS TAB'
      puts '(1) View subjects list'
      puts '(2) Add subject'
      puts '(3) Go back'
      puts '-------------------'

      puts 'Select one: '
      option = gets.to_i

      case option
      when 1
        puts 'LISTS OF SUBJECTS'
        puts '-------------------'
        Subject.list.each do |subject|
          puts "#{subject.id} - #{subject.name}"
        end
        puts '-------------------'
        puts "Press any key to go back."
        gets.chomp

      when 2
        puts 'ADD A NEW SUBJECT'
        puts '-------------------'
        print 'Subject ID: '
        new_subject_id = gets.chomp

        Subject.list.each do |subject|
          if new_subject_id == subject.id
            puts 'Error: Subject ID already taken.'
            exit
          end
        end

        print 'Subject Name: '
        new_subject_name = gets.chomp

        Subject.list.each do |subject|
          if new_subject_name == subject.name
            puts 'Error: Subject Name already taken.'
            exit
          end
        end

        puts 'Would you like to save changes? (y/n)'
        save_input = gets.chomp
        if save_input == 'y' || save_input == 'yes'
          new_subject = Subject.new(new_subject_id, new_subject_name)
          new_subject.save
          puts "Subject has been added successfully. Press any key to go back."
          p Subject.list
        else
          puts "Changes not saved. Press any key to go back."
          gets.chomp
        end

      when 3
        run = false
      else
        puts 'Invalid input'
      end
    end
  end

  def self.fetch_student_tab
    run = true
    while run
      puts '-------------------'
      puts 'STUDENTS TAB'
      puts '(1) View students list'
      puts '(2) Add student'
      puts '(3) Go back'
      puts '-------------------'

      puts 'Select one: '
      option = gets.to_i

      case option
      when 1
        puts 'LISTS OF STUDENTS'
        puts '-------------------'
        Student.list.each do |student|
          puts "---------------------------"
          puts "Student Name: #{student.name}"
          puts "Student ID: #{student.id}"
          student_course = ''
          Course.list.each do |course|
            if student.course_id == course.id
              student_course = course.name
            end
          end
          puts "Course Name: #{student_course}"
          puts "Course ID: #{student.course_id}"
        end
        puts '-------------------'
        puts "Press any key to go back."
        gets.chomp

      when 2
        puts 'ADD A NEW STUDENT'
        puts '-------------------'
        print 'Student ID: '
        new_student_id = gets.chomp

        Student.list.each do |student|
          if new_student_id == student.id
            puts 'Error: Student ID already taken.'
            exit
          end
        end

        print 'Student Name: '
        new_student_name = gets.chomp

        Subject.list.each do |student|
          if new_student_name == student.name
            puts 'Error: Student Name already taken.'
            exit
          end
        end

        print 'Birthdate (MM/DD/YYY): '
        new_birth_date = gets.chomp

        print 'Course ID: '
        new_course_id = gets.chomp

        print 'Parent Name: '
        new_parent = gets.chomp

        puts 'Would you like to save changes? (y/n)'
        save_input = gets.chomp
        if save_input == 'y' || save_input == 'yes'
          new_student = Student.new(new_student_id, new_student_name, new_birth_date, new_course_id, new_parent)
          new_student.save
          puts "Student has been added successfully. Press any key to go back."
          p Student.list
        else
          puts "Changes not saved. Press any key to go back."
          gets.chomp
        end

      when 3
        run = false
      else
        puts 'Invalid input'
      end
    end
  end

  def self.fetch_teacher_tab
    puts 'call teacher tab'
  end

  def self.fetch_room_tab
    puts 'call room tab'
  end

  def self.fetch_enroll_tab
    'call enroll tab'
  end
end

MainMenu.run


