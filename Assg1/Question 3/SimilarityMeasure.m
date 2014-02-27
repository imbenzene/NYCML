function [ Similarity ] = SimilarityMeasure( Vec1 , Vec2 )
%SIMILARITYMEASURE Summary of this function goes here
%   Detailed explanation goes here

Similarity = dot(Vec1,Vec2)/(norm(Vec1) * norm(Vec2));

end

