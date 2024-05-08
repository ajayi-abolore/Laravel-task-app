<?php 
namespace App\Models;
use Illuminate\Database\Eloquent\Model;
class Tasks extends Model 
{
	

	/**
     * The table associated with the model.
     *
     * @var string
     */
	protected $table = 'tasks';
	

	/**
     * The table primary key field
     *
     * @var string
     */
	protected $primaryKey = 'id';
	

	/**
     * Table fillable fields
     *
     * @var array
     */
	protected $fillable = ["title","description","due_date","due_time","status","files","assign_to"];
	

	/**
     * Set search query for the model
	 * @param \Illuminate\Database\Eloquent\Builder $query
	 * @param string $text
     */
	public static function search($query, $text){
		//search table record 
		$search_condition = '(
				id LIKE ?  OR 
				title LIKE ?  OR 
				description LIKE ? 
		)';
		$search_params = [
			"%$text%","%$text%","%$text%"
		];
		//setting search conditions
		$query->whereRaw($search_condition, $search_params);
	}
	

	/**
     * return list page fields of the model.
     * 
     * @return array
     */
	public static function listFields(){
		return [ 
			"id", 
			"title", 
			"description", 
			"due_date", 
			"status", 
			"created_at", 
			"updated_at", 
			"due_time", 
			"assign_to" 
		];
	}
	

	/**
     * return exportList page fields of the model.
     * 
     * @return array
     */
	public static function exportListFields(){
		return [ 
			"id", 
			"title", 
			"description", 
			"due_date", 
			"status", 
			"created_at", 
			"updated_at", 
			"due_time", 
			"assign_to" 
		];
	}
	

	/**
     * return view page fields of the model.
     * 
     * @return array
     */
	public static function viewFields(){
		return [ 
			"id", 
			"title", 
			"description", 
			"due_date", 
			"status", 
			"created_at", 
			"updated_at", 
			"due_time", 
			"files", 
			"assign_to" 
		];
	}
	

	/**
     * return exportView page fields of the model.
     * 
     * @return array
     */
	public static function exportViewFields(){
		return [ 
			"id", 
			"title", 
			"description", 
			"due_date", 
			"status", 
			"created_at", 
			"updated_at", 
			"due_time", 
			"files", 
			"assign_to" 
		];
	}
	

	/**
     * return edit page fields of the model.
     * 
     * @return array
     */
	public static function editFields(){
		return [ 
			"title", 
			"description", 
			"due_date", 
			"due_time", 
			"status", 
			"files", 
			"assign_to", 
			"id" 
		];
	}
	

	/**
     * Indicates if the model should be timestamped.
     *
     * @var bool
     */
	public $timestamps = false;
}
