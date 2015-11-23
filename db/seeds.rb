# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

boxes = Box.create([{ name: 'Raincity Athletics', website: "" }])

wods = Wod.create([{
  title: "",
  description: '<div class="workout"><div class="sectionTitle"><a name="WARMUP(15)"></a><h2>WARMUP (15)</h2></div><div class="skillDesc">500m Interval Row (300/100/100)<br>3 Rounds<br>- 10 Banded Dislocates<br>- 10 Banded Good Mornings<br>- 10 Goblet Squats<br>- 10 Banded YTW<br><br>Muscle Clean + Tall Clean: 3 (3+3)</div><hr><div class="sectionTitle"><a name="ADVANCEDOLYMPIC LIFTING"></a><h2>ADVANCED OLYMPIC LIFTING</h2></div><div class="skillName">2x Clean Pull 1x Squat Clean from Blocks</div><div class="skillDesc">Set blocks so bar sits just above the knee</div><div class="skillResult"></div><hr><div class="skillName">B/H the Neck Jerk</div><div class="skillDesc"></div><div class="skillResult"></div><hr><div class="skillResult">1 x 1 @ 100% </div><hr><div class="sectionTitle"><a name="POST(10)"></a><h2>POST (10)</h2></div><div class="skillDesc">Bent Over Rows: 12-12-12 (increase weight each set)<br>Front Rack Lunges: 12-12-12 (increase weight each set)</div><hr></div>',
  date: "2015-10-10",
  box_id: 1
}])
