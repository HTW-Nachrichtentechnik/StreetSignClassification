function [number, probability] = StreetSignDigitsToNumber(digit_images)
    result_str = '';
    probabilitys = [];
    for i_digit = 1:height(digit_images)
        [number_res, probability] = StreetSignNumber(digit_images(i_digit,:).Image{1});
        probabilitys(i_digit) = probability;
        result_str = [result_str num2str(number_res)];
    end
    number = str2num(result_str);
    probability = mean(probabilitys);
end