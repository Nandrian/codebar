# MEMBERS
class Member
    attr_accessor :full_name
    def initialize(full_name)
        @full_name = full_name
    end
end

# STUDENTS
class Student < Member
    attr_accessor :info
    def initialize(full_name, info)
        super(full_name) 
        @info = info
    end
end

# INSTRUCTORS
class Instructor
    attr_accessor :bio
    def initialize(full_name, bio)
        super(full_name)
        @bio = bio
        @skills = []
    end
    def add_skills(skill)
        @skills << skill
    end
    def skills
        skills_str = ""
        @skills.each{ |x| skills_str += "#{x}, "}
        # skills_str.rstrip.chop
    end
end

# WORKSHOPS
class Workshop
    attr_accessor :date, :classroom, :coaches, :students
    def initialize(date, classroom)
        @date = date
        @classroom = classroom
        @coaches = []
        @students = []
    end

    # Participant
    def add_participant(member)
        if member is_a?(Student)
            students << member
        else 
            coaches << member
        end
    end

    def print_details
        puts "#"
        print_workshop_details
        puts "#"
        print_student_details
        puts "#"
        print_coache_details
    end

    private
    def workshop_details
        puts "#{self.date}, #{classroom}"
    end
    def student_details
        puts "Students"
        students.each_with_index{ |x, i| puts "#{i+1}. #{x.full_name} - #{x.info}"}
    end
    def coaches_details
        puts "Coaches"
        coaches.each_with_index{ |y, i| puts "#{i+1}. #{y.full_name} #{y.skills} #{y.bio}"}
    end
end

workshop = Workshop.new("12/03/2014", "Shutl")

jane = Student.new("Jane Doe", "I am trying to learn programming and need some help")

vicky = Instructor.new("Vicky Ruby", "I want to help people learn coding.")
vicky.add_skill("HTML")
vicky.add_skill("JavaScript")

workshop.add_participant(jane)
workshop.add_participant(lena)
workshop.add_participant(vicky)
workshop.add_participant(nicole)
workshop.print_details