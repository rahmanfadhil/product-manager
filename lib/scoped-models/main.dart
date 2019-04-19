import 'package:scoped_model/scoped_model.dart';

import './products.dart';
import './user.dart';

class MainModel extends Model with UsersModel, ProductsModel {}
