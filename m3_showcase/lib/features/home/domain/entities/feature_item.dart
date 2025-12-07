import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class FeatureItem extends Equatable {
  final String id;
  final String title;
  final String description;
  final IconData icon;
  final String route;
  final Color? accentColor;

  const FeatureItem({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
    required this.route,
    this.accentColor,
  });

  @override
  List<Object?> get props => [id, title, description, icon, route, accentColor];
}