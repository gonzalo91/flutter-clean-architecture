import 'package:learning/core/_shared/entities/user_schedule.dart';

class User{

  final int id;
  final String name;
  final String username;
  final int scheduleId;
  final String uuid;
  final List<UserSchedule> schedule;

  User(this.id, this.name, this.username, this.scheduleId, this.uuid, this.schedule);  

}