class ShowDate {
  final String day;
  final String date;
  final String month;
  final bool selected;

  ShowDate(this.day, this.date, this.month, this.selected);
}

class CinemaFormat {
  final String formatName;
  final List<List<dynamic>> times;

  CinemaFormat(this.formatName, this.times);
}

class Cinema {
  final String cinemaName;
  final List<CinemaFormat> formats;

  Cinema(this.cinemaName, this.formats);
}
