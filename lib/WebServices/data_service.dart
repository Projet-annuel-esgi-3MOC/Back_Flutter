class DataService {
  // Méthode pour récupérer les données du graphique
  List<SalesData> getChartData() {
    //  logique de récupération des données

    return [
      SalesData(year: '2018', sales: 100),
      SalesData(year: '2019', sales: 200),
      SalesData(year: '2020', sales: 150),
      SalesData(year: '2021', sales: 300),
      SalesData(year: '2022', sales: 300),
      SalesData(year: '2023', sales: 300),
      SalesData(year: '2024', sales: 300),
    ];
  }
}

class SalesData {
  final String year;
  final int sales;

  SalesData({required this.year, required this.sales});
}
