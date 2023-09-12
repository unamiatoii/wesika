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


/** This is an auto generated class representing the UserTontine type in your schema. */
class UserTontine extends amplify_core.Model {
  static const classType = const _UserTontineModelType();
  final String id;
  final Tontine? _tontine;
  final User? _user;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  UserTontineModelIdentifier get modelIdentifier {
      return UserTontineModelIdentifier(
        id: id
      );
  }
  
  Tontine get tontine {
    try {
      return _tontine!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  User get user {
    try {
      return _user!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const UserTontine._internal({required this.id, required tontine, required user, createdAt, updatedAt}): _tontine = tontine, _user = user, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory UserTontine({String? id, required Tontine tontine, required User user}) {
    return UserTontine._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      tontine: tontine,
      user: user);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserTontine &&
      id == other.id &&
      _tontine == other._tontine &&
      _user == other._user;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("UserTontine {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("tontine=" + (_tontine != null ? _tontine!.toString() : "null") + ", ");
    buffer.write("user=" + (_user != null ? _user!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  UserTontine copyWith({Tontine? tontine, User? user}) {
    return UserTontine._internal(
      id: id,
      tontine: tontine ?? this.tontine,
      user: user ?? this.user);
  }
  
  UserTontine copyWithModelFieldValues({
    ModelFieldValue<Tontine>? tontine,
    ModelFieldValue<User>? user
  }) {
    return UserTontine._internal(
      id: id,
      tontine: tontine == null ? this.tontine : tontine.value,
      user: user == null ? this.user : user.value
    );
  }
  
  UserTontine.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _tontine = json['tontine']?['serializedData'] != null
        ? Tontine.fromJson(new Map<String, dynamic>.from(json['tontine']['serializedData']))
        : null,
      _user = json['user']?['serializedData'] != null
        ? User.fromJson(new Map<String, dynamic>.from(json['user']['serializedData']))
        : null,
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'tontine': _tontine?.toJson(), 'user': _user?.toJson(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'tontine': _tontine,
    'user': _user,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<UserTontineModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<UserTontineModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final TONTINE = amplify_core.QueryField(
    fieldName: "tontine",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Tontine'));
  static final USER = amplify_core.QueryField(
    fieldName: "user",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'User'));
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "UserTontine";
    modelSchemaDefinition.pluralName = "UserTontines";
    
    modelSchemaDefinition.indexes = [
      amplify_core.ModelIndex(fields: const ["tontineId"], name: "byTontine"),
      amplify_core.ModelIndex(fields: const ["userId"], name: "byUser")
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
      key: UserTontine.TONTINE,
      isRequired: true,
      targetNames: ['tontineId'],
      ofModelName: 'Tontine'
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
      key: UserTontine.USER,
      isRequired: true,
      targetNames: ['userId'],
      ofModelName: 'User'
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

class _UserTontineModelType extends amplify_core.ModelType<UserTontine> {
  const _UserTontineModelType();
  
  @override
  UserTontine fromJson(Map<String, dynamic> jsonData) {
    return UserTontine.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'UserTontine';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [UserTontine] in your schema.
 */
class UserTontineModelIdentifier implements amplify_core.ModelIdentifier<UserTontine> {
  final String id;

  /** Create an instance of UserTontineModelIdentifier using [id] the primary key. */
  const UserTontineModelIdentifier({
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
  String toString() => 'UserTontineModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is UserTontineModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}