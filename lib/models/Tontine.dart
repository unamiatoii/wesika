/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart' as amplify_core;
import 'package:collection/collection.dart';


/** This is an auto generated class representing the Tontine type in your schema. */
class Tontine extends amplify_core.Model {
  static const classType = const _TontineModelType();
  final String id;
  final String? _Nom;
  final String? _MontantRamassage;
  final String? _MontantDepot;
  final amplify_core.TemporalDateTime? _IntervalRamassage;
  final amplify_core.TemporalDateTime? _IntervalDepot;
  final List<UserTontine>? _users;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  TontineModelIdentifier get modelIdentifier {
      return TontineModelIdentifier(
        id: id
      );
  }
  
  String? get Nom {
    return _Nom;
  }
  
  String? get MontantRamassage {
    return _MontantRamassage;
  }
  
  String? get MontantDepot {
    return _MontantDepot;
  }
  
  amplify_core.TemporalDateTime? get IntervalRamassage {
    return _IntervalRamassage;
  }
  
  amplify_core.TemporalDateTime? get IntervalDepot {
    return _IntervalDepot;
  }
  
  List<UserTontine>? get users {
    return _users;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Tontine._internal({required this.id, Nom, MontantRamassage, MontantDepot, IntervalRamassage, IntervalDepot, users, createdAt, updatedAt}): _Nom = Nom, _MontantRamassage = MontantRamassage, _MontantDepot = MontantDepot, _IntervalRamassage = IntervalRamassage, _IntervalDepot = IntervalDepot, _users = users, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Tontine({String? id, String? Nom, String? MontantRamassage, String? MontantDepot, amplify_core.TemporalDateTime? IntervalRamassage, amplify_core.TemporalDateTime? IntervalDepot, List<UserTontine>? users}) {
    return Tontine._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      Nom: Nom,
      MontantRamassage: MontantRamassage,
      MontantDepot: MontantDepot,
      IntervalRamassage: IntervalRamassage,
      IntervalDepot: IntervalDepot,
      users: users != null ? List<UserTontine>.unmodifiable(users) : users);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Tontine &&
      id == other.id &&
      _Nom == other._Nom &&
      _MontantRamassage == other._MontantRamassage &&
      _MontantDepot == other._MontantDepot &&
      _IntervalRamassage == other._IntervalRamassage &&
      _IntervalDepot == other._IntervalDepot &&
      DeepCollectionEquality().equals(_users, other._users);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Tontine {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("Nom=" + "$_Nom" + ", ");
    buffer.write("MontantRamassage=" + "$_MontantRamassage" + ", ");
    buffer.write("MontantDepot=" + "$_MontantDepot" + ", ");
    buffer.write("IntervalRamassage=" + (_IntervalRamassage != null ? _IntervalRamassage!.format() : "null") + ", ");
    buffer.write("IntervalDepot=" + (_IntervalDepot != null ? _IntervalDepot!.format() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Tontine copyWith({String? Nom, String? MontantRamassage, String? MontantDepot, amplify_core.TemporalDateTime? IntervalRamassage, amplify_core.TemporalDateTime? IntervalDepot, List<UserTontine>? users}) {
    return Tontine._internal(
      id: id,
      Nom: Nom ?? this.Nom,
      MontantRamassage: MontantRamassage ?? this.MontantRamassage,
      MontantDepot: MontantDepot ?? this.MontantDepot,
      IntervalRamassage: IntervalRamassage ?? this.IntervalRamassage,
      IntervalDepot: IntervalDepot ?? this.IntervalDepot,
      users: users ?? this.users);
  }
  
  Tontine copyWithModelFieldValues({
    ModelFieldValue<String?>? Nom,
    ModelFieldValue<String?>? MontantRamassage,
    ModelFieldValue<String?>? MontantDepot,
    ModelFieldValue<amplify_core.TemporalDateTime?>? IntervalRamassage,
    ModelFieldValue<amplify_core.TemporalDateTime?>? IntervalDepot,
    ModelFieldValue<List<UserTontine>?>? users
  }) {
    return Tontine._internal(
      id: id,
      Nom: Nom == null ? this.Nom : Nom.value,
      MontantRamassage: MontantRamassage == null ? this.MontantRamassage : MontantRamassage.value,
      MontantDepot: MontantDepot == null ? this.MontantDepot : MontantDepot.value,
      IntervalRamassage: IntervalRamassage == null ? this.IntervalRamassage : IntervalRamassage.value,
      IntervalDepot: IntervalDepot == null ? this.IntervalDepot : IntervalDepot.value,
      users: users == null ? this.users : users.value
    );
  }
  
  Tontine.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _Nom = json['Nom'],
      _MontantRamassage = json['MontantRamassage'],
      _MontantDepot = json['MontantDepot'],
      _IntervalRamassage = json['IntervalRamassage'] != null ? amplify_core.TemporalDateTime.fromString(json['IntervalRamassage']) : null,
      _IntervalDepot = json['IntervalDepot'] != null ? amplify_core.TemporalDateTime.fromString(json['IntervalDepot']) : null,
      _users = json['users'] is List
        ? (json['users'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => UserTontine.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'Nom': _Nom, 'MontantRamassage': _MontantRamassage, 'MontantDepot': _MontantDepot, 'IntervalRamassage': _IntervalRamassage?.format(), 'IntervalDepot': _IntervalDepot?.format(), 'users': _users?.map((UserTontine? e) => e?.toJson()).toList(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'Nom': _Nom,
    'MontantRamassage': _MontantRamassage,
    'MontantDepot': _MontantDepot,
    'IntervalRamassage': _IntervalRamassage,
    'IntervalDepot': _IntervalDepot,
    'users': _users,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<TontineModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<TontineModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final NOM = amplify_core.QueryField(fieldName: "Nom");
  static final MONTANTRAMASSAGE = amplify_core.QueryField(fieldName: "MontantRamassage");
  static final MONTANTDEPOT = amplify_core.QueryField(fieldName: "MontantDepot");
  static final INTERVALRAMASSAGE = amplify_core.QueryField(fieldName: "IntervalRamassage");
  static final INTERVALDEPOT = amplify_core.QueryField(fieldName: "IntervalDepot");
  static final USERS = amplify_core.QueryField(
    fieldName: "users",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'UserTontine'));
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Tontine";
    modelSchemaDefinition.pluralName = "Tontines";
    
    modelSchemaDefinition.authRules = [
      amplify_core.AuthRule(
        authStrategy: amplify_core.AuthStrategy.PUBLIC,
        operations: const [
          amplify_core.ModelOperation.CREATE,
          amplify_core.ModelOperation.UPDATE,
          amplify_core.ModelOperation.DELETE,
          amplify_core.ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Tontine.NOM,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Tontine.MONTANTRAMASSAGE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Tontine.MONTANTDEPOT,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Tontine.INTERVALRAMASSAGE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Tontine.INTERVALDEPOT,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: Tontine.USERS,
      isRequired: false,
      ofModelName: 'UserTontine',
      associatedKey: UserTontine.TONTINE
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _TontineModelType extends amplify_core.ModelType<Tontine> {
  const _TontineModelType();
  
  @override
  Tontine fromJson(Map<String, dynamic> jsonData) {
    return Tontine.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Tontine';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Tontine] in your schema.
 */
class TontineModelIdentifier implements amplify_core.ModelIdentifier<Tontine> {
  final String id;

  /** Create an instance of TontineModelIdentifier using [id] the primary key. */
  const TontineModelIdentifier({
    required this.id});
  
  @override
  Map<String, dynamic> serializeAsMap() => (<String, dynamic>{
    'id': id
  });
  
  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
    .entries
    .map((entry) => (<String, dynamic>{ entry.key: entry.value }))
    .toList();
  
  @override
  String serializeAsString() => serializeAsMap().values.join('#');
  
  @override
  String toString() => 'TontineModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is TontineModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}