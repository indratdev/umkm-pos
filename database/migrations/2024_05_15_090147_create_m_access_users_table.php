<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
  /**
   * Run the migrations.
   */
  public function up(): void
  {
    Schema::create('m_access_users', function (Blueprint $table) {
      $table->id();
      $table->string('pid');
      $table->string('branch_id');
      $table->string('user_id');
      $table->integer('actived')->default(1);
      $table->integer('deleted')->default(0);
      $table->timestamp('modification_at')->nullable();
      $table->integer('modification_by')->nullable();
      $table->timestamp('deleted_at')->nullable();
      $table->integer('deleted_by')->nullable();
      $table->timestamps();
    });
  }

  /**
   * Reverse the migrations.
   */
  public function down(): void
  {
    Schema::dropIfExists('m_access_users');
  }
};
