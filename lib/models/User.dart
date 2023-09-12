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


/** This is an auto generated class representing the User type in your schema. */
class User extends amplify_core.Model {
  static const classType = const _UserModelType();
  final String id;
  final String? _Nom;
  final String? _Prenom;
  final String? _Email;
  final String? _Telephone;
  final List<UserTontine>? _Participant;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  UserModelIdentifier get modelIdentifier {
      return UserModelIdentifier(
        id: id
      );
  }
  
  String? get Nom {
    return _Nom;
  }
  
  String? get Prenom {
    return _Prenom;
  }
  
  String? get Email {
    return _Email;
  }
  
  String? get Telephone {
    return _Telephone;
  }
  
  List<UserTontine>? get Participant {
    return _Participant;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const User._internal({required this.id, Nom, Prenom, Email, Telephone, Participant, createdAt, updatedAt}): _Nom = Nom, _Prenom = Prenom, _Email = Email, _Telephone = Telephone, _Participant = Participant, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory User({String? id, String? Nom, String? Prenom, String? Email, String? Telephone, List<UserTontine>? Participant}) {
    return User._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      Nom: Nom,
      Prenom: Prenom,
      Email: Email,
      Telephone: Telephone,
      Participant: Participant != null ? List<UserTontine>.unmodifiable(Participant) : Participant);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is User &&
      id == other.id &&
      _Nom == other._Nom &&
      _Prenom == other._Prenom &&
      _Email == other._Email &&
      _Telephone == other._Telephone &&
      DeepCollectionEquality().equals(_Participant, other._Participant);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("User {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("Nom=" + "$_Nom" + ", ");
    buffer.write("Prenom=" + "$_Prenom" + ", ");
    buffer.write("Email=" + "$_Email" + ", ");
    buffer.write("Telephone=" + "$_Telephone" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  User copyWith({String? Nom, String? Prenom, String? Email, String? Telephone, List<UserTontine>? Participant}) {
    return User._internal(
      id: id,
      Nom: Nom ?? this.Nom,
      Prenom: Prenom ?? this.Prenom,
      Email: Email ?? this.Email,
      Telephone: Telephone ?? this.Telephone,
      Participant: Participant ?? this.Participant);
  }
  
  User copyWithModelFieldValues({
    ModelFieldValue<String?>? Nom,
    ModelFieldValue<String?>? Prenom,
    ModelFieldValue<String?>? Email,
    ModelFieldValue<String?>? Telephone,
    ModelFieldValue<List<UserTontine>?>? Participant
  }) {
    return User._internal(
      id: id,
      Nom: Nom == null ? this.Nom : Nom.value,
      Prenom: Prenom == null ? this.Prenom : Prenom.value,
      Email: Email == null ? this.Email : Email.value,
      Telephone: Telephone == null ? this.Telephone : Telephone.value,
      Participant: Participant == null ? this.Participant : Participant.value
    );
  }
  
  User.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _Nom = json['Nom'],
      _Prenom = json['Prenom'],
      _Email = json['Email'],
      _Telephone = json['Telephone'],
      _Participant = json['Participant'] is List
        ? (json['Participant'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => UserTontine.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'Nom': _Nom, 'Prenom': _Prenom, 'Email': _Email, 'Telephone': _Telephone, 'Participant': _Participant?.map((UserTontine? e) => e?.toJson()).toList(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'Nom': _Nom,
    'Prenom': _Prenom,
    'Email': _Email,
    'Telephone': _Telephone,
    'Participant': _Participant,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<UserModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<UserModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final NOM = amplify_core.QueryField(fieldName: "Nom");
  static final PRENOM = amplify_core.QueryField(fieldName: "Prenom");
  static final EMAIL = amplify_core.QueryField(fieldName: "Email");
  static final TELEPHONE = amplify_core.QueryField(fieldName: "Telephone");
  static final PARTICIPANT = amplify_core.QueryField(
    fieldName: "Participant",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'UserTontine'));
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "User";
    modelSchemaDefinition.pluralName = "Users";
    
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
      key: User.NOM,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: User.PRENOM,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: User.EMAIL,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: User.TELEPHONE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: User.PARTICIPANT,
      isRequired: false,
      ofModelName: 'UserTontine',
      associatedKey: UserTontine.USER
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

class _UserModelType extends amplify_core.ModelType<User> {
  const _UserModelType();
  
  @override
  User fromJson(Map<String, dynamic> jsonData) {
    return User.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'User';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [User] in your schema.
 */
class UserModelIdentifier implements amplify_core.ModelIdentifier<User> {
  final String id;

  /** Create an instance of UserModelIdentifier using [id] the primary key. */
  const UserModelIdentifier({
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
  String toString() => 'UserModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is UserModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}