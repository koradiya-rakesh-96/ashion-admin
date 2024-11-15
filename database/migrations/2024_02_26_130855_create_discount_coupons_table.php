<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('discount_coupons', function (Blueprint $table) {
            $table->id();
            $table->string('code');

            //human readable discount coupon name
            $table->string('name')->nullable();

            // Description of coupon
            $table->text('description')->nullable();

            // Max Uses discount coupon has
            $table->integer('max_uses')->nullable();

            // How many time user can use this coupon
            $table->integer('max_uses_user')->nullable();

            // The coupon is percent or fixed type
            $table->enum('type',['percent','fixed'])->default('fixed');

            // The amount to discount based on type
            $table->double('discount_amount',10,2);

            // The amount to discount based on type
            $table->double('min_amount',10,2)->nullable();

            $table->integer('status')->default(1);

            // When the coupon begins
            $table->timestamp('starts_at')->nullable();

            // When the coupon ends
            $table->timestamp('expires_at')->nullable();

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('discount_coupons');
    }
};
