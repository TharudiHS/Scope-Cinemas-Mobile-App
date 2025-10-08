class SeatLayoutModel {
  static List<List<String>> generateRows(int rowCount, int seatCount) =>
      List.generate(rowCount, (_) => List.filled(seatCount, "available"));

  // DIRECTOR’S LOUNGE layout
  static List<List<List<String>>> getDirectorLoungeSeats() {
    return [
      [...generateRows(3, 3), ...generateRows(2, 5)],
      generateRows(5, 6),
      [...generateRows(3, 3), ...generateRows(2, 5)],
    ];
  }

  // STANDARD layout
  static List<List<List<String>>> getStandardSeats() {
    return [
      [...generateRows(3, 4), ...generateRows(3, 5), ...generateRows(1, 4)],
      generateRows(7, 8),
      [...generateRows(3, 4), ...generateRows(3, 5), ...generateRows(1, 4)],
    ];
  }
}
