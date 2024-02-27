//
//  APICaller.swift
//  Netflix Clone
//
//  Created by Dwianditya Hanif Raharjanto on 29/02/24.
//

import Foundation

struct Constants {
    static let API_KEY = "5130214baab0db7ecf4dffa3198a4e75"
    static let baseURL = "https://api.themoviedb.org"
//    static let YT_API_KEY = "AIzaSyC25R9FVPQSH2btuPxYh7NDrj7WLERDkDU"
    static let YoutubeAPI_KEY = "AIzaSyC25R9FVPQSH2btuPxYh7NDrj7WLERDkDU"
    static let YoutubeBaseURL = "https://youtube.googleapis.com/youtube/v3/search?"
}

enum APIError: Error {
    case failedToGetData
}

class APICaller {
    static let shared = APICaller()
    
    
    func getTrendingMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/movie/day?api_key=\(Constants.API_KEY)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {return}
            do {
                let results = try JSONDecoder().decode(TrendingTitlesResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }
        
        task.resume()
    }
    
    func getTrendingTv(completion: @escaping (Result<[Title],Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/tv/day?api_key=\(Constants.API_KEY)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {return}
            do {
                let results = try JSONDecoder().decode(TrendingTitlesResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }
        
        task.resume()
    }
    
    func getUpcomingMovie(completion: @escaping (Result<[Title],Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/upcoming?api_key=\(Constants.API_KEY)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {return}
            do {
                let results = try JSONDecoder().decode(TrendingTitlesResponse.self, from: data)
                completion(.success(results.results))
                
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }
        
        task.resume()
    }
    
    func getPopularMovie(completion: @escaping (Result<[Title],Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/popular?api_key=\(Constants.API_KEY)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {return}
            do {
                let results = try JSONDecoder().decode(TrendingTitlesResponse.self, from: data)
                completion(.success(results.results))
                
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }
        
        task.resume()
    }
    
    func getTopRatedMovie(completion: @escaping (Result<[Title],Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/top_rated?api_key=\(Constants.API_KEY)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {return}
            do {
                let results = try JSONDecoder().decode(TrendingTitlesResponse.self, from: data)
                completion(.success(results.results))
                
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }
        
        task.resume()
    }
    
    func getDiscoverMovies(completion: @escaping (Result<[Title],Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/discover/movie?api_key=\(Constants.API_KEY)&include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {return}
            do {
                let results = try JSONDecoder().decode(TrendingTitlesResponse.self, from: data)
                completion(.success(results.results))
                
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }
        
        task.resume()
    
    }
    
    func search(with query: String, completion: @escaping (Result<[Title],Error>) -> Void) {
        
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {return}
        guard let url = URL(string: "\(Constants.baseURL)/3/search/movie?query=\(query)&api_key=\(Constants.API_KEY)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {return}
            do {
                let results = try JSONDecoder().decode(TrendingTitlesResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }
        
        task.resume()
    }
    
    func getMovie(with query: String, completion: @escaping (Result<VideoElement, Error>) -> Void) {
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {return}
        guard let url = URL(string: "\(Constants.YoutubeBaseURL)q=\(query)&type=video&key=\(Constants.YoutubeAPI_KEY)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
//                let results = try JSONSerialization.jsonObject(with: data)
//                print(results)
                let results = try JSONDecoder().decode(YoutubeSearchResponse.self, from: data)
//                print(results)
                completion(.success(results.items[0]))
                

            } catch {
                completion(.failure(error))
//                print(error.localizedDescription)
            }

        }
        task.resume()
    }
    
    func getReviewsMovie(movie_id: Int) throws -> ReviewsResponse {
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/\(movie_id)/reviews?api_key=\(Constants.API_KEY)") else {
            throw APIError.failedToGetData
        }
        
        let semaphore = DispatchSemaphore(value: 0)
        var reviewsResponse: ReviewsResponse?
        var error: Error?
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, err in
            defer { semaphore.signal() }
            guard let data = data, err == nil else {
                error = APIError.failedToGetData
                return
            }
            do {
                reviewsResponse = try JSONDecoder().decode(ReviewsResponse.self, from: data)
            } catch {
                print(error)
            }
        }
        task.resume()
        
        _ = semaphore.wait(timeout: .distantFuture)
        
        if let error = error {
            throw error
        } else if let reviewsResponse = reviewsResponse {
            return reviewsResponse
        } else {
            throw APIError.failedToGetData
        }
    }
    
    func getMoviesGenre(completion: @escaping (Result<[Genre], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/genre/movie/list?api_key=\(Constants.API_KEY)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {return}
            do {
                let results = try JSONDecoder().decode(GenresResponse.self, from: data)
//                let results = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                print(results)
                completion(.success(results.genres))
            } catch {
                print(error)
                completion(.failure(APIError.failedToGetData))
            }
        }
        
        task.resume()
        
        
    }
    
    func getMoviesDetail(movie_id: Int) throws -> MovieResponse {
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/\(movie_id)?api_key=\(Constants.API_KEY)") else {
            throw APIError.failedToGetData
        }
        
        var result: Result<MovieResponse, Error>?
        let semaphore = DispatchSemaphore(value: 0)
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            defer { semaphore.signal() }
            
            guard let data = data, error == nil else {
                result = .failure(APIError.failedToGetData)
                return
            }
            
            do {
                let movieResponse = try JSONDecoder().decode(MovieResponse.self, from: data)
                result = .success(movieResponse)
            } catch {
                result = .failure(error)
            }
        }
        
        task.resume()
        _ = semaphore.wait(timeout: .distantFuture)
        
        if let result = result {
            switch result {
            case .success(let movieResponse):
                return movieResponse
            case .failure(let error):
                throw error
            }
        } else {
            throw APIError.failedToGetData
        }
    }
    
    func getMoviesbyGenre(genre: String, completion: @escaping (Result<[Title], Error>) -> Void){
        guard let url = URL(string: "\(Constants.baseURL)/3/discover/movie?api_key=\(Constants.API_KEY)&include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.descwith_genres=\(genre)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {return}
            do {
                let results = try JSONDecoder().decode(TrendingTitlesResponse.self, from: data)
                //                                let results = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                print(results)
                //                completion(.success(results.results))
            } catch {
                print(error)
                completion(.failure(APIError.failedToGetData))
            }
        }
        
        task.resume()
    }
}





