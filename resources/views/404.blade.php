@extends('front.layouts.app')

@section('content')
    <section class="page_404" style="background:#fff; font-family: 'Arvo', serif;">
        <div class="container">
            <div class="row">	
                <div class="col-sm-12 ">
                    <div class="col-sm-offset-1  text-center">
                        <div class="four_zero_four_bg" style="background-image: url(https://cdn.dribbble.com/users/285475/screenshots/2083086/dribbble_1.gif);height: 400px;background-position: center;">
                            <h1 class="text-center" style="font-size:80px;">404</h1>
                        </div>
                        <div class="contant_box_404" style="margin-top:-50px;">
                            <h3 class="h2" style="font-size:80px;">Look like you're lost</h3>
                            <p style="font-size: 30px">the page you are looking for is not avaible!</p>
                            <a href="{{ route('front.home') }}" class="link_404" style="color: #fff!important;padding: 10px 20px;background: #39ac31;margin: 20px 0;display: inline-block;">Go to Home</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection

@section('customJs')
    
@endsection