# == Schema Information
#
# Table name: enrollments
#
#  id         :integer          not null, primary key
#  course_id  :integer
#  student_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Enrollment < ApplicationRecord
  belongs_to :user,
    class_name: :User,
    foreign_key: :student_id,
    primary_key: :id


  belongs_to :course,
    class_name: :Course,
    foreign_key: :course_id,
    primary_key: :id

end


#
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
