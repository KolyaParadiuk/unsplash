// GENERATED CODE - DO NOT MODIFY BY HAND

part of photo;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Urls> _$urlsSerializer = new _$UrlsSerializer();
Serializer<Photo> _$photoSerializer = new _$PhotoSerializer();

class _$UrlsSerializer implements StructuredSerializer<Urls> {
  @override
  final Iterable<Type> types = const [Urls, _$Urls];
  @override
  final String wireName = 'Urls';

  @override
  Iterable<Object?> serialize(Serializers serializers, Urls object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'raw',
      serializers.serialize(object.raw, specifiedType: const FullType(String)),
      'full',
      serializers.serialize(object.full, specifiedType: const FullType(String)),
      'regular',
      serializers.serialize(object.regular,
          specifiedType: const FullType(String)),
      'small',
      serializers.serialize(object.small,
          specifiedType: const FullType(String)),
      'thumb',
      serializers.serialize(object.thumb,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Urls deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UrlsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'raw':
          result.raw = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'full':
          result.full = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'regular':
          result.regular = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'small':
          result.small = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'thumb':
          result.thumb = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$PhotoSerializer implements StructuredSerializer<Photo> {
  @override
  final Iterable<Type> types = const [Photo, _$Photo];
  @override
  final String wireName = 'Photo';

  @override
  Iterable<Object?> serialize(Serializers serializers, Photo object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'urls',
      serializers.serialize(object.urls, specifiedType: const FullType(Urls)),
    ];

    return result;
  }

  @override
  Photo deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PhotoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'urls':
          result.urls.replace(serializers.deserialize(value,
              specifiedType: const FullType(Urls))! as Urls);
          break;
      }
    }

    return result.build();
  }
}

class _$Urls extends Urls {
  @override
  final String raw;
  @override
  final String full;
  @override
  final String regular;
  @override
  final String small;
  @override
  final String thumb;

  factory _$Urls([void Function(UrlsBuilder)? updates]) =>
      (new UrlsBuilder()..update(updates)).build();

  _$Urls._(
      {required this.raw,
      required this.full,
      required this.regular,
      required this.small,
      required this.thumb})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(raw, 'Urls', 'raw');
    BuiltValueNullFieldError.checkNotNull(full, 'Urls', 'full');
    BuiltValueNullFieldError.checkNotNull(regular, 'Urls', 'regular');
    BuiltValueNullFieldError.checkNotNull(small, 'Urls', 'small');
    BuiltValueNullFieldError.checkNotNull(thumb, 'Urls', 'thumb');
  }

  @override
  Urls rebuild(void Function(UrlsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UrlsBuilder toBuilder() => new UrlsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Urls &&
        raw == other.raw &&
        full == other.full &&
        regular == other.regular &&
        small == other.small &&
        thumb == other.thumb;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, raw.hashCode), full.hashCode), regular.hashCode),
            small.hashCode),
        thumb.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Urls')
          ..add('raw', raw)
          ..add('full', full)
          ..add('regular', regular)
          ..add('small', small)
          ..add('thumb', thumb))
        .toString();
  }
}

class UrlsBuilder implements Builder<Urls, UrlsBuilder> {
  _$Urls? _$v;

  String? _raw;
  String? get raw => _$this._raw;
  set raw(String? raw) => _$this._raw = raw;

  String? _full;
  String? get full => _$this._full;
  set full(String? full) => _$this._full = full;

  String? _regular;
  String? get regular => _$this._regular;
  set regular(String? regular) => _$this._regular = regular;

  String? _small;
  String? get small => _$this._small;
  set small(String? small) => _$this._small = small;

  String? _thumb;
  String? get thumb => _$this._thumb;
  set thumb(String? thumb) => _$this._thumb = thumb;

  UrlsBuilder();

  UrlsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _raw = $v.raw;
      _full = $v.full;
      _regular = $v.regular;
      _small = $v.small;
      _thumb = $v.thumb;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Urls other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Urls;
  }

  @override
  void update(void Function(UrlsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Urls build() {
    final _$result = _$v ??
        new _$Urls._(
            raw: BuiltValueNullFieldError.checkNotNull(raw, 'Urls', 'raw'),
            full: BuiltValueNullFieldError.checkNotNull(full, 'Urls', 'full'),
            regular: BuiltValueNullFieldError.checkNotNull(
                regular, 'Urls', 'regular'),
            small:
                BuiltValueNullFieldError.checkNotNull(small, 'Urls', 'small'),
            thumb:
                BuiltValueNullFieldError.checkNotNull(thumb, 'Urls', 'thumb'));
    replace(_$result);
    return _$result;
  }
}

class _$Photo extends Photo {
  @override
  final String id;
  @override
  final Urls urls;

  factory _$Photo([void Function(PhotoBuilder)? updates]) =>
      (new PhotoBuilder()..update(updates)).build();

  _$Photo._({required this.id, required this.urls}) : super._() {
    BuiltValueNullFieldError.checkNotNull(id, 'Photo', 'id');
    BuiltValueNullFieldError.checkNotNull(urls, 'Photo', 'urls');
  }

  @override
  Photo rebuild(void Function(PhotoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PhotoBuilder toBuilder() => new PhotoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Photo && id == other.id && urls == other.urls;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, id.hashCode), urls.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Photo')
          ..add('id', id)
          ..add('urls', urls))
        .toString();
  }
}

class PhotoBuilder implements Builder<Photo, PhotoBuilder> {
  _$Photo? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  UrlsBuilder? _urls;
  UrlsBuilder get urls => _$this._urls ??= new UrlsBuilder();
  set urls(UrlsBuilder? urls) => _$this._urls = urls;

  PhotoBuilder();

  PhotoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _urls = $v.urls.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Photo other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Photo;
  }

  @override
  void update(void Function(PhotoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Photo build() {
    _$Photo _$result;
    try {
      _$result = _$v ??
          new _$Photo._(
              id: BuiltValueNullFieldError.checkNotNull(id, 'Photo', 'id'),
              urls: urls.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'urls';
        urls.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Photo', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
