import '../models/moedas.dart';

class MoedaRepository {
  static List<Moeda> tabela = [
    Moeda(
      icone: 'images/btc.png',
      nome: 'Bitcoin',
      sigla: 'BTC',
      preco: 164603.00,
    ),
    Moeda(
      icone: 'images/ethereum.png',
      nome: 'Ethereum',
      sigla: 'ETH',
      preco: 9716.00,
    ),
    Moeda(
      icone: 'images/xrp.png',
      nome: 'XRP',
      sigla: 'XRP',
      preco: 3.34,
    ),
    Moeda(
      icone: 'images/cardano.png',
      nome: 'Cardano',
      sigla: 'Ada',
      preco: 6.32,
    ),
    Moeda(
      icone: 'images/usdCoin.png',
      nome: 'USD Coin',
      sigla: 'USDC',
      preco: 5.02,
    ),
    Moeda(
      icone: 'images/liteCoinpng.png',
      nome: 'Litecoin',
      sigla: 'LTC',
      preco: 669.93,
    )
  ];
}
