// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorFlutterDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$FlutterDatabaseBuilder databaseBuilder(String name) =>
      _$FlutterDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$FlutterDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$FlutterDatabaseBuilder(null);
}

class _$FlutterDatabaseBuilder {
  _$FlutterDatabaseBuilder(this.name);

  final String name;

  final List<Migration> _migrations = [];

  Callback _callback;

  /// Adds migrations to the builder.
  _$FlutterDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$FlutterDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<FlutterDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name)
        : ':memory:';
    final database = _$FlutterDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$FlutterDatabase extends FlutterDatabase {
  _$FlutterDatabase([StreamController<String> listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  CityDao _cityDaoInstance;

  SizeDao _sizeDaoInstance;

  ColorDao _colorDaoInstance;

  GenderDao _genderDaoInstance;

  ExpenseDao _expenseDaoInstance;

  CustomerDao _customerDaoInstance;

  GenIdDao _genIdDaoInstance;

  UserDao _userDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `City` (`cityId` INTEGER PRIMARY KEY AUTOINCREMENT, `cityName` TEXT)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `ItemSize` (`sizeId` INTEGER PRIMARY KEY AUTOINCREMENT, `sizeName` TEXT)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Color` (`colorId` INTEGER PRIMARY KEY AUTOINCREMENT, `colorName` TEXT)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Gender` (`genderId` INTEGER PRIMARY KEY AUTOINCREMENT, `genderName` TEXT)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Expense` (`expenseId` INTEGER PRIMARY KEY AUTOINCREMENT, `expenseName` TEXT)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Customer` (`cusId` TEXT, `cusName` TEXT, `cusPhoneNo` TEXT, `cusAddress` TEXT, `cusRegDate` TEXT, `cusEmail` TEXT, `cusSocialLink` TEXT, `cityId` INTEGER, `genderId` INTEGER, PRIMARY KEY (`cusId`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `GenId` (`period` TEXT, `type` TEXT, `serialNo` INTEGER, PRIMARY KEY (`period`, `type`, `serialNo`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `User` (`phoneNo` TEXT, `password` TEXT, `userName` TEXT, PRIMARY KEY (`phoneNo`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  CityDao get cityDao {
    return _cityDaoInstance ??= _$CityDao(database, changeListener);
  }

  @override
  SizeDao get sizeDao {
    return _sizeDaoInstance ??= _$SizeDao(database, changeListener);
  }

  @override
  ColorDao get colorDao {
    return _colorDaoInstance ??= _$ColorDao(database, changeListener);
  }

  @override
  GenderDao get genderDao {
    return _genderDaoInstance ??= _$GenderDao(database, changeListener);
  }

  @override
  ExpenseDao get expenseDao {
    return _expenseDaoInstance ??= _$ExpenseDao(database, changeListener);
  }

  @override
  CustomerDao get customerDao {
    return _customerDaoInstance ??= _$CustomerDao(database, changeListener);
  }

  @override
  GenIdDao get genIdDao {
    return _genIdDaoInstance ??= _$GenIdDao(database, changeListener);
  }

  @override
  UserDao get userDao {
    return _userDaoInstance ??= _$UserDao(database, changeListener);
  }
}

class _$CityDao extends CityDao {
  _$CityDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _cityInsertionAdapter = InsertionAdapter(
            database,
            'City',
            (City item) => <String, dynamic>{
                  'cityId': item.cityId,
                  'cityName': item.cityName
                },
            changeListener),
        _cityUpdateAdapter = UpdateAdapter(
            database,
            'City',
            ['cityId'],
            (City item) => <String, dynamic>{
                  'cityId': item.cityId,
                  'cityName': item.cityName
                },
            changeListener),
        _cityDeletionAdapter = DeletionAdapter(
            database,
            'City',
            ['cityId'],
            (City item) => <String, dynamic>{
                  'cityId': item.cityId,
                  'cityName': item.cityName
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _cityMapper = (Map<String, dynamic> row) =>
      City(row['cityId'] as int, row['cityName'] as String);

  final InsertionAdapter<City> _cityInsertionAdapter;

  final UpdateAdapter<City> _cityUpdateAdapter;

  final DeletionAdapter<City> _cityDeletionAdapter;

  @override
  Future<City> findCityById(int id) async {
    return _queryAdapter.query('SELECT * FROM city WHERE id = ?',
        arguments: <dynamic>[id], mapper: _cityMapper);
  }

  @override
  Future<List<City>> findAllCity() async {
    return _queryAdapter.queryList('SELECT * FROM city', mapper: _cityMapper);
  }

  @override
  Stream<List<City>> findAllCityAsStream() {
    return _queryAdapter.queryListStream('SELECT * FROM city',
        queryableName: 'City', isView: false, mapper: _cityMapper);
  }

  @override
  Future<void> insertCity(City city) async {
    await _cityInsertionAdapter.insert(city, OnConflictStrategy.abort);
  }

  @override
  Future<void> insertCites(List<City> city) async {
    await _cityInsertionAdapter.insertList(city, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateCity(City city) async {
    await _cityUpdateAdapter.update(city, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteCity(City city) async {
    await _cityDeletionAdapter.delete(city);
  }
}

class _$SizeDao extends SizeDao {
  _$SizeDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _itemSizeInsertionAdapter = InsertionAdapter(
            database,
            'ItemSize',
            (ItemSize item) => <String, dynamic>{
                  'sizeId': item.sizeId,
                  'sizeName': item.sizeName
                }),
        _itemSizeUpdateAdapter = UpdateAdapter(
            database,
            'ItemSize',
            ['sizeId'],
            (ItemSize item) => <String, dynamic>{
                  'sizeId': item.sizeId,
                  'sizeName': item.sizeName
                }),
        _itemSizeDeletionAdapter = DeletionAdapter(
            database,
            'ItemSize',
            ['sizeId'],
            (ItemSize item) => <String, dynamic>{
                  'sizeId': item.sizeId,
                  'sizeName': item.sizeName
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _itemSizeMapper = (Map<String, dynamic> row) =>
      ItemSize(row['sizeId'] as int, row['sizeName'] as String);

  static final _cityMapper = (Map<String, dynamic> row) =>
      City(row['cityId'] as int, row['cityName'] as String);

  final InsertionAdapter<ItemSize> _itemSizeInsertionAdapter;

  final UpdateAdapter<ItemSize> _itemSizeUpdateAdapter;

  final DeletionAdapter<ItemSize> _itemSizeDeletionAdapter;

  @override
  Future<ItemSize> findSizeById(int id) async {
    return _queryAdapter.query('SELECT * FROM ItemSize WHERE id = ?',
        arguments: <dynamic>[id], mapper: _itemSizeMapper);
  }

  @override
  Future<List<ItemSize>> findAllSize() async {
    return _queryAdapter.queryList('SELECT * FROM ItemSize',
        mapper: _itemSizeMapper);
  }

  @override
  Stream<List<City>> findAllSizesAsStream() {
    return _queryAdapter.queryListStream('SELECT * FROM ItemSize',
        queryableName: 'City', isView: false, mapper: _cityMapper);
  }

  @override
  Future<void> insertSize(ItemSize itemSize) async {
    await _itemSizeInsertionAdapter.insert(itemSize, OnConflictStrategy.abort);
  }

  @override
  Future<void> insertSizes(List<ItemSize> list) async {
    await _itemSizeInsertionAdapter.insertList(list, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateSize(ItemSize size) async {
    await _itemSizeUpdateAdapter.update(size, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteSize(ItemSize size) async {
    await _itemSizeDeletionAdapter.delete(size);
  }
}

class _$ColorDao extends ColorDao {
  _$ColorDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _colorInsertionAdapter = InsertionAdapter(
            database,
            'Color',
            (Color item) => <String, dynamic>{
                  'colorId': item.colorId,
                  'colorName': item.colorName
                },
            changeListener),
        _colorUpdateAdapter = UpdateAdapter(
            database,
            'Color',
            ['colorId'],
            (Color item) => <String, dynamic>{
                  'colorId': item.colorId,
                  'colorName': item.colorName
                },
            changeListener),
        _colorDeletionAdapter = DeletionAdapter(
            database,
            'Color',
            ['colorId'],
            (Color item) => <String, dynamic>{
                  'colorId': item.colorId,
                  'colorName': item.colorName
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _colorMapper = (Map<String, dynamic> row) =>
      Color(row['colorId'] as int, row['colorName'] as String);

  final InsertionAdapter<Color> _colorInsertionAdapter;

  final UpdateAdapter<Color> _colorUpdateAdapter;

  final DeletionAdapter<Color> _colorDeletionAdapter;

  @override
  Future<Color> findColorById(int id) async {
    return _queryAdapter.query('SELECT * FROM color WHERE id = ?',
        arguments: <dynamic>[id], mapper: _colorMapper);
  }

  @override
  Future<List<Color>> findAllTasks() async {
    return _queryAdapter.queryList('SELECT * FROM color', mapper: _colorMapper);
  }

  @override
  Stream<List<Color>> findAllTasksAsStream() {
    return _queryAdapter.queryListStream('SELECT * FROM color',
        queryableName: 'Color', isView: false, mapper: _colorMapper);
  }

  @override
  Future<void> insertColor(Color color) async {
    await _colorInsertionAdapter.insert(color, OnConflictStrategy.abort);
  }

  @override
  Future<void> insertColors(List<Color> color) async {
    await _colorInsertionAdapter.insertList(color, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateColor(Color color) async {
    await _colorUpdateAdapter.update(color, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteColor(Color color) async {
    await _colorDeletionAdapter.delete(color);
  }
}

class _$GenderDao extends GenderDao {
  _$GenderDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _genderInsertionAdapter = InsertionAdapter(
            database,
            'Gender',
            (Gender item) => <String, dynamic>{
                  'genderId': item.genderId,
                  'genderName': item.genderName
                }),
        _genderUpdateAdapter = UpdateAdapter(
            database,
            'Gender',
            ['genderId'],
            (Gender item) => <String, dynamic>{
                  'genderId': item.genderId,
                  'genderName': item.genderName
                }),
        _genderDeletionAdapter = DeletionAdapter(
            database,
            'Gender',
            ['genderId'],
            (Gender item) => <String, dynamic>{
                  'genderId': item.genderId,
                  'genderName': item.genderName
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _genderMapper = (Map<String, dynamic> row) =>
      Gender(row['genderId'] as int, row['genderName'] as String);

  static final _cityMapper = (Map<String, dynamic> row) =>
      City(row['cityId'] as int, row['cityName'] as String);

  final InsertionAdapter<Gender> _genderInsertionAdapter;

  final UpdateAdapter<Gender> _genderUpdateAdapter;

  final DeletionAdapter<Gender> _genderDeletionAdapter;

  @override
  Future<Gender> findGenderById(int id) async {
    return _queryAdapter.query('SELECT * FROM gender WHERE id = ?',
        arguments: <dynamic>[id], mapper: _genderMapper);
  }

  @override
  Future<List<Gender>> findAllGender() async {
    return _queryAdapter.queryList('SELECT * FROM gender',
        mapper: _genderMapper);
  }

  @override
  Stream<List<City>> findAllGenderAsStream() {
    return _queryAdapter.queryListStream('SELECT * FROM gender',
        queryableName: 'City', isView: false, mapper: _cityMapper);
  }

  @override
  Future<void> insertGender(Gender gender) async {
    await _genderInsertionAdapter.insert(gender, OnConflictStrategy.abort);
  }

  @override
  Future<void> insertGenders(List<Gender> list) async {
    await _genderInsertionAdapter.insertList(list, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateGender(Gender gender) async {
    await _genderUpdateAdapter.update(gender, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteGender(Gender gender) async {
    await _genderDeletionAdapter.delete(gender);
  }
}

class _$ExpenseDao extends ExpenseDao {
  _$ExpenseDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _expenseInsertionAdapter = InsertionAdapter(
            database,
            'Expense',
            (Expense item) => <String, dynamic>{
                  'expenseId': item.expenseId,
                  'expenseName': item.expenseName
                }),
        _expenseUpdateAdapter = UpdateAdapter(
            database,
            'Expense',
            ['expenseId'],
            (Expense item) => <String, dynamic>{
                  'expenseId': item.expenseId,
                  'expenseName': item.expenseName
                }),
        _expenseDeletionAdapter = DeletionAdapter(
            database,
            'Expense',
            ['expenseId'],
            (Expense item) => <String, dynamic>{
                  'expenseId': item.expenseId,
                  'expenseName': item.expenseName
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _expenseMapper = (Map<String, dynamic> row) =>
      Expense(row['expenseId'] as int, row['expenseName'] as String);

  static final _cityMapper = (Map<String, dynamic> row) =>
      City(row['cityId'] as int, row['cityName'] as String);

  final InsertionAdapter<Expense> _expenseInsertionAdapter;

  final UpdateAdapter<Expense> _expenseUpdateAdapter;

  final DeletionAdapter<Expense> _expenseDeletionAdapter;

  @override
  Future<Expense> findExpenseById(int id) async {
    return _queryAdapter.query('SELECT * FROM expense WHERE id = ?',
        arguments: <dynamic>[id], mapper: _expenseMapper);
  }

  @override
  Future<List<Expense>> findAllExpense() async {
    return _queryAdapter.queryList('SELECT * FROM expense',
        mapper: _expenseMapper);
  }

  @override
  Stream<List<City>> findAllExpenseAsStream() {
    return _queryAdapter.queryListStream('SELECT * FROM expense',
        queryableName: 'City', isView: false, mapper: _cityMapper);
  }

  @override
  Future<void> insertExpense(Expense expense) async {
    await _expenseInsertionAdapter.insert(expense, OnConflictStrategy.abort);
  }

  @override
  Future<void> insertExpenses(List<Expense> list) async {
    await _expenseInsertionAdapter.insertList(list, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateExpense(Expense expense) async {
    await _expenseUpdateAdapter.update(expense, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteExpense(Expense expense) async {
    await _expenseDeletionAdapter.delete(expense);
  }
}

class _$CustomerDao extends CustomerDao {
  _$CustomerDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _customerInsertionAdapter = InsertionAdapter(
            database,
            'Customer',
            (Customer item) => <String, dynamic>{
                  'cusId': item.cusId,
                  'cusName': item.cusName,
                  'cusPhoneNo': item.cusPhoneNo,
                  'cusAddress': item.cusAddress,
                  'cusRegDate': item.cusRegDate,
                  'cusEmail': item.cusEmail,
                  'cusSocialLink': item.cusSocialLink,
                  'cityId': item.cityId,
                  'genderId': item.genderId
                }),
        _customerUpdateAdapter = UpdateAdapter(
            database,
            'Customer',
            ['cusId'],
            (Customer item) => <String, dynamic>{
                  'cusId': item.cusId,
                  'cusName': item.cusName,
                  'cusPhoneNo': item.cusPhoneNo,
                  'cusAddress': item.cusAddress,
                  'cusRegDate': item.cusRegDate,
                  'cusEmail': item.cusEmail,
                  'cusSocialLink': item.cusSocialLink,
                  'cityId': item.cityId,
                  'genderId': item.genderId
                }),
        _customerDeletionAdapter = DeletionAdapter(
            database,
            'Customer',
            ['cusId'],
            (Customer item) => <String, dynamic>{
                  'cusId': item.cusId,
                  'cusName': item.cusName,
                  'cusPhoneNo': item.cusPhoneNo,
                  'cusAddress': item.cusAddress,
                  'cusRegDate': item.cusRegDate,
                  'cusEmail': item.cusEmail,
                  'cusSocialLink': item.cusSocialLink,
                  'cityId': item.cityId,
                  'genderId': item.genderId
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _cityMapper = (Map<String, dynamic> row) =>
      City(row['cityId'] as int, row['cityName'] as String);

  final InsertionAdapter<Customer> _customerInsertionAdapter;

  final UpdateAdapter<Customer> _customerUpdateAdapter;

  final DeletionAdapter<Customer> _customerDeletionAdapter;

  @override
  Future<City> findCustomerById(int id) async {
    return _queryAdapter.query('SELECT * FROM customer WHERE id = ?',
        arguments: <dynamic>[id], mapper: _cityMapper);
  }

  @override
  Future<List<City>> findAllCustomers() async {
    return _queryAdapter.queryList('SELECT * FROM customer',
        mapper: _cityMapper);
  }

  @override
  Stream<List<City>> findAllCustomersAsStream() {
    return _queryAdapter.queryListStream('SELECT * FROM customer',
        queryableName: 'City', isView: false, mapper: _cityMapper);
  }

  @override
  Future<void> insertCustomer(Customer customer) async {
    await _customerInsertionAdapter.insert(customer, OnConflictStrategy.abort);
  }

  @override
  Future<void> insertCustomers(List<Customer> customer) async {
    await _customerInsertionAdapter.insertList(
        customer, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateCustomer(Customer customer) async {
    await _customerUpdateAdapter.update(customer, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteCustomer(Customer customer) async {
    await _customerDeletionAdapter.delete(customer);
  }
}

class _$GenIdDao extends GenIdDao {
  _$GenIdDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _genIdInsertionAdapter = InsertionAdapter(
            database,
            'GenId',
            (GenId item) => <String, dynamic>{
                  'period': item.period,
                  'type': item.type,
                  'serialNo': item.serialNo
                }),
        _genIdUpdateAdapter = UpdateAdapter(
            database,
            'GenId',
            ['period', 'type', 'serialNo'],
            (GenId item) => <String, dynamic>{
                  'period': item.period,
                  'type': item.type,
                  'serialNo': item.serialNo
                }),
        _genIdDeletionAdapter = DeletionAdapter(
            database,
            'GenId',
            ['period', 'type', 'serialNo'],
            (GenId item) => <String, dynamic>{
                  'period': item.period,
                  'type': item.type,
                  'serialNo': item.serialNo
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _cityMapper = (Map<String, dynamic> row) =>
      City(row['cityId'] as int, row['cityName'] as String);

  final InsertionAdapter<GenId> _genIdInsertionAdapter;

  final UpdateAdapter<GenId> _genIdUpdateAdapter;

  final DeletionAdapter<GenId> _genIdDeletionAdapter;

  @override
  Future<City> finGenIdByID(String period, String type, int serialNo) async {
    return _queryAdapter.query(
        'SELECT * FROM genId WHERE period = ? and type = ? and serialNo =?',
        arguments: <dynamic>[period, type, serialNo],
        mapper: _cityMapper);
  }

  @override
  Future<List<City>> findAll() async {
    return _queryAdapter.queryList('SELECT * FROM genId', mapper: _cityMapper);
  }

  @override
  Stream<List<City>> findAllAsSteam() {
    return _queryAdapter.queryListStream('SELECT * FROM genId',
        queryableName: 'City', isView: false, mapper: _cityMapper);
  }

  @override
  Future<void> insertGenId(GenId genId) async {
    await _genIdInsertionAdapter.insert(genId, OnConflictStrategy.abort);
  }

  @override
  Future<void> insertGenIds(List<GenId> genId) async {
    await _genIdInsertionAdapter.insertList(genId, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateGenId(GenId genId) async {
    await _genIdUpdateAdapter.update(genId, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteGenId(GenId genId) async {
    await _genIdDeletionAdapter.delete(genId);
  }
}

class _$UserDao extends UserDao {
  _$UserDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _userInsertionAdapter = InsertionAdapter(
            database,
            'User',
            (User item) => <String, dynamic>{
                  'phoneNo': item.phoneNo,
                  'password': item.password,
                  'userName': item.userName
                },
            changeListener),
        _userUpdateAdapter = UpdateAdapter(
            database,
            'User',
            ['phoneNo'],
            (User item) => <String, dynamic>{
                  'phoneNo': item.phoneNo,
                  'password': item.password,
                  'userName': item.userName
                },
            changeListener),
        _userDeletionAdapter = DeletionAdapter(
            database,
            'User',
            ['phoneNo'],
            (User item) => <String, dynamic>{
                  'phoneNo': item.phoneNo,
                  'password': item.password,
                  'userName': item.userName
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _cityMapper = (Map<String, dynamic> row) =>
      City(row['cityId'] as int, row['cityName'] as String);

  static final _userMapper = (Map<String, dynamic> row) => User();

  final InsertionAdapter<User> _userInsertionAdapter;

  final UpdateAdapter<User> _userUpdateAdapter;

  final DeletionAdapter<User> _userDeletionAdapter;

  @override
  Future<City> findUserById(String phoneNo, String password) async {
    return _queryAdapter.query(
        'SELECT * FROM user WHERE phoneNo = ? and password = ?',
        arguments: <dynamic>[phoneNo, password],
        mapper: _cityMapper);
  }

  @override
  Future<List<User>> findAllUser() async {
    return _queryAdapter.queryList('SELECT * FROM user', mapper: _userMapper);
  }

  @override
  Stream<List<User>> findAllUserAsStream() {
    return _queryAdapter.queryListStream('SELECT * FROM user',
        queryableName: 'User', isView: false, mapper: _userMapper);
  }

  @override
  Future<void> insertUser(User user) async {
    await _userInsertionAdapter.insert(user, OnConflictStrategy.abort);
  }

  @override
  Future<void> insertUsers(List<User> user) async {
    await _userInsertionAdapter.insertList(user, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateUser(User user) async {
    await _userUpdateAdapter.update(user, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteUser(User user) async {
    await _userDeletionAdapter.delete(user);
  }
}
