import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testing/cubit/favorite_cubit/favorite_cubite.dart';
import 'package:testing/cubit/favorite_cubit/favorite_state.dart';
import 'package:testing/model/products_model.dart';
import 'package:testing/pages/display_a_product_page/display_a_product_page.dart';

import '../../../constant/scale_constant.dart';

class CustomerProductCardWidget extends StatefulWidget {
  const CustomerProductCardWidget({
    super.key,
    required this.product,
  });
  final ProductsModel product;

  @override
  State<CustomerProductCardWidget> createState() =>
      _CustomerProductCardWidgetState();
}

class _CustomerProductCardWidgetState extends State<CustomerProductCardWidget> {
  SharedPreferences? prefs;

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();

    prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<FavoriteCubite>(context).refresh();
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(
        DisplayAProductPage.id,
        arguments: widget.product,
      ),
      child: Center(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 10,
                    spreadRadius: 0.2,
                    offset: const Offset(2, 4),
                  )
                ],
              ),
              child: Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 8.0,
                    right: 8.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.product.title.split(" ").elementAt(0) +
                            r' ' +
                            widget.product.title.split(" ").elementAt(1),
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(r'$'
                              '${widget.product.price % 1 == 0 ? widget.product.price.toInt() : widget.product.price}'),
                          IconButton(
                            onPressed: () {
                              BlocProvider.of<FavoriteCubite>(context)
                                  .changeSelectFavorite(data: widget.product);
                            },
                            icon: BlocBuilder<FavoriteCubite, FavoriteState>(
                              builder: ((context, state) {
                                return Icon(Icons.favorite,
                                    color: prefs?.getBool(
                                                widget.product.id.toString()) ??
                                            false
                                        ? Colors.red
                                        : Colors.grey);
                              }),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: -AppScale(context).height! / 15,
              left: AppScale(context).width! / 12,
              child: Image.network(widget.product.image,
                  width: AppScale(context).width! / 4,
                  height: AppScale(context).height! / 9),
            ),
          ],
        ),
      ),
    );
  }
}
