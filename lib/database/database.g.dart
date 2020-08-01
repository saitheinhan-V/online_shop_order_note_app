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
