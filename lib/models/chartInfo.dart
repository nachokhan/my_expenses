import 'transaction.dart';

class ChartInfo {
  Map<int, double> weekDaysAmount = {
    /* DateTime.monday: 0.0,
    DateTime.tuesday: 0.0,
    DateTime.wednesday: 0.0,
    DateTime.thursday: 0.0,
    DateTime.friday: 0.0,
    DateTime.saturday: 0.0,
    DateTime.sunday: 0.0,*/
  };

  Map<int, double> fillFromLastDays(List<Transaction> txs, int days) {
    final hoy = DateTime.now();
    final lastDay = hoy.subtract(Duration(days: days));
    final lastTxs = txs.where((element) => element.date.isAfter(lastDay));

    for (int i = 0; i <= 7; i++) {
      var dayToAdd = hoy.subtract(Duration(days: i)).weekday;

      weekDaysAmount.putIfAbsent(dayToAdd, () => 0.0);
    }

    lastTxs.forEach((tx) {
      weekDaysAmount[tx.date.weekday] += tx.amount;
    });

    return weekDaysAmount;
  }
}
