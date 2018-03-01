# == Schema Information
#
# Table name: courses
#
#  id            :integer          not null, primary key
#  name          :string
#  prereq_id     :integer
#  instructor_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Course < ApplicationRecord

  has_many :enrollments,
    foreign_key: :course_id,
    primary_key: :id,
    class_name: :Enrollment

    has_many :users,
      through: :enrollments,
      source: :user

    belongs_to :prerequisite,
      class_name: :Course,
      primary_key: :id,
      foreign_key: :prereq_id

    belongs_to :instructor,
      class_name: :User,
      primary_key: :id,
      foreign_key: :instructor_id

end


# ActiveRecord::Schema.define(version: 20170710184251) do
#
#   create_table "courses", force: :cascade do |t|
#     t.string "name"
#     t.integer "prereq_id"
#     t.integer "instructor_id"
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#   end
#
#   create_table "enrollments", force: :cascade do |t|
#     t.integer "course_id"
#     t.integer "student_id"
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#   end
#
#   create_table "users", force: :cascade do |t|
#     t.string "name"
#     t.datetime "created_at", null: false
#     t.datetime "wupdated_at", null: false
#   end
